using System;
using Todo.Shared.Extensions;
using Todo.Shared.Types;

namespace Todo.Shared.DTO
{
    public class Task
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public bool Completed { get; set; }
        public DateTime DueOn { get; set; }
        public string RelativeDueOn
        {
            get
            {
                return this.DueOn.ToRelative();
            }
        }
        public string DueOnString
        {
            get
            {
                return this.DueOn.ToString("MMM dd, yyyy");
            }
        }
        public DateTime CreatedOn { get; set; }
        public User User { get; set; }
    }
}
