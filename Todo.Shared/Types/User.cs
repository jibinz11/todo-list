using System;
using System.Collections.Generic;
using System.Text;
using Todo.Shared.DTO;

namespace Todo.Shared.Types
{
    public class User
    {
        public Guid Id { get; set; }
        public string Name
        {
            get
            {
                return $"{FirstName} {LastName}";
            }
        }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public IEnumerable<Task> Tasks { get; set; }
    }
}
