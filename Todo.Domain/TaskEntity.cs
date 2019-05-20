using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Todo.DataAccess;
using Todo.Shared.DTO;

namespace Todo.Domain
{

    public class TaskEntity
    {
        TaskRepository _repo = null;
        public TaskEntity()
        {
            _repo = new TaskRepository();
        }
        public bool Add(Task task)
        {
            task.Id = Guid.NewGuid();
            return _repo.Add(task);
        }
        public bool Delete(string id)
        {
            return _repo.Delete(id);
        }
        public IList<Task> Get(string userId)
        {
            return _repo.Get(userId);
        }
        public int Count()
        {
            return _repo.Count();
        }
        public IEnumerable<IGrouping<string, Task>> GetGrouped(string userId)
        {
            return _repo.GetGrouped(userId);
        }
        public bool ToggleComplete(string id)
        {
            return _repo.ToggleComplete(id);
        }
    }
}
