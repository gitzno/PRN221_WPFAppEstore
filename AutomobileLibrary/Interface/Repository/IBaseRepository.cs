using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eshop.Interface.Repository
{
    public interface IBaseRepository<Entity>
    {
        /// <summary>
        /// Get all Entity in database
        /// </summary>
        /// <returns>
        ///     list Entitys
        /// </returns>
        /// @author: gitzno
        /// @date: 06/01/2023
        IEnumerable<Entity> GetEntitys();
        /// <summary>
        /// get Entity with id 
        /// </summary>
        /// <param name="id">id Entity</param>
        /// <returns>
        /// a Entity have id like id Entity input
        /// </returns>
        /// @author: gitzno
        /// @date: 06/01/2023

        Entity GetEntityById(int id);
        /// <summary>
        /// insert a new Entity
        /// </summary>
        /// <param name="Entity">object new Entity</param>
        /// @author: gitzno
        /// @date: 06/01/2023
        void InsertEntity(Entity Entity);
        /// <summary>
        /// update Entity 
        /// </summary>
        /// <param name="Entity">object with new Entity</param>
        /// @author: gitzno
        /// @date: 06/01/2023
        void UpdateEntity(Entity Entity);
        /// <summary>
        /// Delete Entity with id input
        /// </summary>
        /// <param name="id">id Entity delete</param>
        /// @author: gitzno
        /// @date: 06/01/2023
        void DeleteEntity(int id);

    }
}
