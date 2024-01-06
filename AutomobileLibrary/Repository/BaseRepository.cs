using Eshop.Interface.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutomobileLibrary.Repository
{

    public class BaseRepository<Entity> : IBaseRepository<Entity>, IDisposable
    {
        //using singleton pattern
        private static BaseRepository<Entity> instance = null;
        private static readonly object instanceLock = new object();
        private
        public void DeleteEntity(int id)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            Console.WriteLine("Dispose connection");

        }

        public Entity GetEntityById(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Entity> GetEntitys()
        {
            throw new NotImplementedException();
        }

        public void InsertEntity(Entity Entity)
        {
            throw new NotImplementedException();
        }

        public void UpdateEntity(Entity Entity)
        {
            throw new NotImplementedException();
        }
    }
}
