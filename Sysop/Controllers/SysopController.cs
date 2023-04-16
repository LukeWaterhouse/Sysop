using Microsoft.AspNetCore.Mvc;
using Sysop;

namespace Sysop.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SysopController : ControllerBase
    {
        [HttpGet(Name = "GetTicket")]
        public string Get()
        {
            return "GetTicket";
        }

        [HttpPost(Name = "CreateTicket")]
        public string Post()
        {


            return "CreateTicket";
        }
    }
}