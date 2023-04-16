using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sysop.Domain.Models
{
    public abstract class Task
    {
        public bool TaskComplete { get; set; }
        public Appointment Appointment { get; set; }
        public Ticket Ticket { get; set; }
    }
}
