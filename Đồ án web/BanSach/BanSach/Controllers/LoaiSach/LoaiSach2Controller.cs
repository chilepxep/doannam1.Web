using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class LoaiSach2Controller : Controller
    {
        // GET: LoaiSach2
        QLBanSachEntities db = new QLBanSachEntities();
        public ActionResult LoaiSach2()
        {
            var result = db.Products.Where(s => s.Category_id == 2);
            return View(result);
        }
    }
}