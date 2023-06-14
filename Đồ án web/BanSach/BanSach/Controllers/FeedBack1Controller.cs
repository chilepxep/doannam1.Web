using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class FeedBack1Controller : Controller
    {
        QLBanSachEntities db = new QLBanSachEntities();
        // GET: FeedBack1
        public ActionResult Index()
        {
            return View(db.Feedbacks.ToList());
        }
        [HttpGet]
        public ActionResult YKienNguoiDung()
        {
            return View();
        }
        [HttpPost]
        public ActionResult YKienNguoiDung(Feedback _userid)
        {
            db.Feedbacks.Add(_userid);
            User _user = new User();
            Feedback _fb = new Feedback();
            _fb.User_id = _user.ID;
            db.SaveChanges();
            return RedirectToAction("Index", "TrangChu");
        }
    }
}