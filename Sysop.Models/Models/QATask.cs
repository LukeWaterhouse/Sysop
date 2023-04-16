using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sysop.Domain.Models
{
    public class QATask : Task
    {
        public bool QAResult { get; set; }

        public string Notes { get; set; }



    }
}
