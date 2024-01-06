using Microsoft.Extensions.DependencyInjection;
using System.Configuration;
using System.Data;
using System.Windows;
using AutomobileLibrary.Interface;
using AutomobileLibrary.Repository;
using AutomobileWPFApp;
using AutomobileLibrary;
namespace AutomobileWPFApp
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private ServiceProvider serviceProvider;
        public App()
        {
            //Config for DependencyInjection (01)
            ServiceCollection services = new ServiceCollection();
            ConfigureServices(services);
            serviceProvider = services.BuildServiceProvider();
        }
        private void ConfigureServices(ServiceCollection services)
        {
            services.AddSingleton(typeof(ICarRepository), typeof(CarRepository));
            services.AddSingleton<WindowCarManagement>();
        }
        private void OnStartup(object sender, StartupEventArgs e)
        {
            var windowCarMianagenent = serviceProvider.GetService<WindowCarManagement>();
            windowCarMianagenent.Show();
        }
    }

}
