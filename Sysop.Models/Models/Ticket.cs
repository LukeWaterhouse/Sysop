namespace Sysop.Domain.Models
{
    public class Ticket
    {
        public Customer Customer { get; set; }
        public string? JobPrice { get; set; }
        public string? JobDescription { get; set; }
        public DateTime? CompleteDateEstimate { get; set; }
        public bool IsActive { get; set; }
        public string? FixCategoryID { get; set; }

        public Ticket(Customer customer)
        {
            Customer = customer;
            JobPrice = null;
            JobDescription = null;
            CompleteDateEstimate = null;
            IsActive = true;
            FixCategoryID = null;
        }
    }
}
