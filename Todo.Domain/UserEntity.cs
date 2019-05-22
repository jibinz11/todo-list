using System;
using System.Collections.Generic;
using System.Text;
using Todo.DataAccess;
using Todo.Shared.Types;

namespace Todo.Domain
{
    public class UserEntity
    {
        UserRepository _repo = null;
        public UserEntity()
        {
            _repo = new UserRepository();
        }
        public bool Add(User user)
        {
            return _repo.Add(user);
        }       
        public Tuple<bool, string,string> Authenticate(string userName, string password)
        {
            User user = _repo.Find(userName);
            if (user == null)
                return new Tuple<bool, string,string>(false, "This user doesn't exists",null);
            if (user.Password.Equals(password, StringComparison.Ordinal))
            {

                return new Tuple<bool, string,string>(true, user.Name,user.Id.ToString());
            }
            else
            {
                return new Tuple<bool, string,string>(false, "Username or password doesn't match. Try again",null);
            }

        }
    }
}
