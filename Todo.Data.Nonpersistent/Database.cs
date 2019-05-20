using System;
using System.Collections.Generic;
using System.Text;
using Todo.Shared.DTO;
using Todo.Shared.Types;

namespace Todo.Data.Nonpersistent
{
    public  class Database
    {
        public static IList<Task> Tasks { get; set; } = new List<Task>();
        public static IList<User> Users { get; set; } = new List<User>();
    }
}
