using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Todo.Data.Nonpersistent;
using Todo.Shared.Types;

namespace Todo.DataAccess
{
    public class UserRepository
    {
        public bool Add(User user)
        {
            Database.Users.Add(user);
            return true;
        }
        public bool Delete(string id)
        {
            var user = Database.Users.FirstOrDefault(x => x.Id == new Guid(id));
            if (user != null)
            {
                Database.Users.Remove(user);
                return true;
            }
            return false;
        }
        public IList<User> Get()
        {
            return Database.Users;
        }
        public int Count()
        {
            return Database.Users.Count;
        }
        public User Find(string userName)
        {
            return Database.Users.FirstOrDefault(x => x.UserName == userName);
        }
    }
}
