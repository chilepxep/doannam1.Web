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
    
    public partial class Order_Details
    {
        public int ID { get; set; }
        public Nullable<int> Product_id { get; set; }
        public Nullable<int> Order_id { get; set; }
        public Nullable<int> Price { get; set; }
        public Nullable<int> Num { get; set; }
    
        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
