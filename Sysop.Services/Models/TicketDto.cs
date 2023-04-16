using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sysop.Services.Models
{
    internal class TicketDto
    {
        public CustomerDto Customer { get; set; }
        public string? JobPrice { get; set; }
        public string? JobDescription { get; set; }
        public DateTime? CompleteDateEstimate { get; set; }
        public bool IsActive { get; set; }
        public string? FixCategoryID { get; set; }
    }
}
