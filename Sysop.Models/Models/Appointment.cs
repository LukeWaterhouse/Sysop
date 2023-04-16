using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sysop.Domain.Models
{
    public class Appointment
    {
        public string AppointmentID { get; set; }
        public Consultant Consultant { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
    }
}


// This is Onion Architecture, works hand in hand with DDD, DDD works mostly within the domain layer

// can be tempting to include logic in the service layer but this is not good, google anaemic domain model..
// https://stackoverflow.com/questions/21339657/whats-the-difference-between-service-layer-and-domain-model-layer/21339774#21339774

// This is the domain layer

// The Onion:

// UI/API layer

// Services layer - interaction with the domain, controlling and initiating workflows within the domain layer

// Domain layer - should be properly expressive of the domain, encapsulate the business logic and relationships between entities.
// Interactions and functionality between entities

// Repository/Data

//Controller -> Service -> Domain -> Data