using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using Todo.Shared.DTO;
using Todo.Data.Nonpersistent;
using Todo.Shared.Types;
using Todo.Shared.Extensions;

namespace Todo.DataAccess
{
    public class TaskRepository
    {
        public bool Add(Task task)
        {
            Database.Tasks.Add(task);
            return true;
        }
        public bool Delete(string id)
        {
            var task=Database.Tasks.FirstOrDefault(x => x.Id == new Guid(id));
            if (task != null)
            {
                Database.Tasks.Remove(task);
                return true;
            }
            return false;
        }
        public bool ToggleComplete(string id)
        {
            var task = Database.Tasks.FirstOrDefault(x => x.Id == new Guid(id));
            if (task != null)
            {
                task.Completed = !task.Completed;
                return true;
            }
            return false;
        }
        public IList<Task> Get(string userId)
        {
            return Database.Tasks.Where(x => x.User.Id == new Guid(userId)).ToList();
        }
        public IEnumerable<IGrouping<string,Task>> GetGrouped(string userId)
        {
            var group= Database.Tasks.Where(x => x.User.Id == new Guid(userId)).OrderByDescending(x=>x.DueOn).GroupBy(x=>x.RelativeDueOn);
            return group;
        }
        public int Count()
        {
            return Database.Tasks.Count;
        }
    }
}
