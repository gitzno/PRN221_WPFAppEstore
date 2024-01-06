using Eshop.Interface.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eshop.Service
{
    public class BaseService<Entity> : IBaseService<Entity>
    {
        public int DeleteService(Entity entity)
        {
            throw new NotImplementedException();
        }

        public int InsertService(Entity entity)
        {
            throw new NotImplementedException();
        }

        public int UpdateService(Entity entity)
        {
            throw new NotImplementedException();
        }
    }
}
