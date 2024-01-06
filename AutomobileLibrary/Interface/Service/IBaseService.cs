using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eshop.Interface.Service
{
    public interface IBaseService<Entity>
    {
        public int InsertService(Entity entity);
        public int UpdateService(Entity entity);
        public int DeleteService(Entity entity);


    }
}
