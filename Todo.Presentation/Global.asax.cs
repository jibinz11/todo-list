using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using Todo.Domain;
using Todo.Shared.DTO;
using Todo.Shared.Types;

namespace Todo.Presentation
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //Pre filling database
            var taskEntity = new TaskEntity();
            var userEntity = new UserEntity();
            #region db-populate
            User user1 = new Shared.Types.User
            {
                FirstName = "Glenn",
                LastName = "Maxwell",
                Id = new Guid("1ea47150-0c5e-43d3-a84e-f0ce16eb62f2"),
                Password = "password1",
                UserName = "testuser1"
            };
            User user2 = new Shared.Types.User
            {
                FirstName = "Jesus",
                LastName = "Christ",
                Id = Guid.NewGuid(),
                Password = "password2",
                UserName = "testuser2"
            };
            User user3 = new Shared.Types.User
            {
                FirstName = "Ricky",
                LastName = "Ponting",
                Id = Guid.NewGuid(),
                Password = "password3",
                UserName = "testuser3"
            };
            User user4 = new Shared.Types.User
            {
                FirstName = "Kane",
                LastName = "Williamson",
                Id = Guid.NewGuid(),
                Password = "password4",
                UserName = "testuser4"
            };
            User user5 = new Shared.Types.User
            {
                FirstName = "Sachin",
                LastName = "Tendulkar",
                Id = Guid.NewGuid(),
                Password = "password5",
                UserName = "testuser5"
            };
            User user6 = new Shared.Types.User
            {
                FirstName = "Peter",
                LastName = "Henry",
                Id = Guid.NewGuid(),
                Password = "password6",
                UserName = "testuser6"
            };
            userEntity.Add(user1);
            userEntity.Add(user2);
            userEntity.Add(user3);
            userEntity.Add(user4);
            userEntity.Add(user5);
            userEntity.Add(user6);

            var r = new Random();
            for (int i = 0; i < 50; i++)
            {
                Task t = new Task
                {
                    Id = Guid.NewGuid(),
                    Title = "title of task-" + (i + 1),
                    Description = "This is a description of task-" + (i + 1),
                    CreatedOn = DateTime.Now,
                    DueOn = DateTime.Now.AddDays(r.Next(0, 20)),
                    User = i > 24 ? user1 : user2,
                    Completed = i % 2 == 0
                };
                taskEntity.Add(t);
            }
            Task daily6 = new Task
            {
                Id = Guid.NewGuid(),
                Title = "Daily Call",
                Description = "Daily call for team leads and developers with client at 6pm",
                CreatedOn = DateTime.Now,
                DueOn = DateTime.Now,
                Completed = false,
                User = user6
            };
            taskEntity.Add(daily6);
            Task scrum1 = new Task
            {
                Id = Guid.NewGuid(),
                Title = "Daily Scrum Meeting",
                Description = "Daily standup meeting conducts on 10 AM with all the developers, Test leads and the client if available",
                CreatedOn = DateTime.Now,
                DueOn = DateTime.Now,
                Completed = false,
                User = user1
            };
            taskEntity.Add(scrum1);
            Task scrum2 = new Task
            {
                Id = Guid.NewGuid(),
                Title = "Daily Scrum Meeting",
                Description = "Daily standup meeting conducts on 10 AM with all the developers, Test leads and the client if available",
                CreatedOn = DateTime.Now,
                DueOn = DateTime.Now,
                Completed = false,
                User = user2
            };
            taskEntity.Add(scrum2);
            Task scrum3 = new Task
            {
                Id = Guid.NewGuid(),
                Title = "Daily Scrum Meeting",
                Description = "Daily standup meeting conducts on 10 AM with all the developers, Test leads and the client if available",
                CreatedOn = DateTime.Now,
                DueOn = DateTime.Now,
                Completed = false,
                User = user3
            };
            taskEntity.Add(scrum3);
            Task scrum4 = new Task
            {
                Id = Guid.NewGuid(),
                Title = "Daily Scrum Meeting",
                Description = "Daily standup meeting conducts on 10 AM with all the developers, Test leads and the client if available",
                CreatedOn = DateTime.Now,
                DueOn = DateTime.Now,
                Completed = false,
                User = user4
            };
            taskEntity.Add(scrum4);
            Task scrum5 = new Task
            {
                Id = Guid.NewGuid(),
                Title = "Daily Scrum Meeting",
                Description = "Daily standup meeting conducts on 10 AM with all the developers, Test leads and the client if available",
                CreatedOn = DateTime.Now,
                DueOn = DateTime.Now,
                Completed = false,
                User = user5
            };
            taskEntity.Add(scrum5);
            Task scrum6 = new Task
            {
                Id = Guid.NewGuid(),
                Title = "Daily Scrum Meeting",
                Description = "Daily standup meeting conducts on 10 AM with all the developers, Test leads and the client if available",
                CreatedOn = DateTime.Now,
                DueOn = DateTime.Now,
                Completed = false,
                User = user6
            };
            taskEntity.Add(scrum6);
            
            #endregion db-populate
        }
    }
}