using System;
using System.Linq;
using System.Web.Http;
using Todo.Domain;
using Todo.Shared.DTO;

namespace Todo.Presentation.Controllers
{
    public class TaskController : ApiController
    {
        TaskEntity _entity = null;
   
        public TaskController()
        {
            _entity = new TaskEntity();
        }
        [HttpPost]
        public IHttpActionResult Add(Task task)
        {

            return Ok( _entity.Add(task));
        }
        [HttpPost]
        public IHttpActionResult Delete(string id)
        {
            return Ok(_entity.Delete(id));
        }
        [HttpPost]
        public IHttpActionResult ToggleComplete(string id)
        {
            return Ok(_entity.ToggleComplete(id));
        }
        public IHttpActionResult Get( string userID)
        {
            return Ok(_entity.Get(userID));
        }
        public IHttpActionResult GetGrouped( string userID)
        {
           
            return Ok(_entity.GetGrouped(userID));
        }
    }
}