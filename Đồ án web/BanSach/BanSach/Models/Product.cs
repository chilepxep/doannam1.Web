//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BanSach.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public Product()
        {
            this.Order_Details = new HashSet<Order_Details>();
        }
    
        public int ID { get; set; }
        public Nullable<int> Category_id { get; set; }
        public string Title { get; set; }
        public Nullable<int> Price { get; set; }
        public Nullable<int> Discount { get; set; }
        public string Thumbnail { get; set; }
        public string Description { get; set; }
        public Nullable<int> Inventory { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual ICollection<Order_Details> Order_Details { get; set; }
    }
}
