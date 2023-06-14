using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class LoaiSachController : Controller
    {
        // GET: LoaiSach
        QLBanSachEntities db = new QLBanSachEntities();
        public ActionResult LoaiSach()       
        {
            var result = db.Products.Where(s => s.Category_id == 1);
            return View(result);
        }
        public PartialViewResult DMSP ()
        {
            return PartialView(db.Categories.ToList());
        }
    }
}