using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;
namespace BanSach.Controllers
{
    public class LoginFormController : Controller
    {
        QLBanSachEntities db = new QLBanSachEntities();
        // GET: LoginForm
        public ActionResult Index()
        {
            return View(db.Users.ToList());
        }
        [HttpGet]
        public ActionResult FormLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Authen(User _user)
        {

                var Check = db.Users.FirstOrDefault(s => s.Email == _user.Email && s.Password == _user.Password);
                if (Check != null && _user.Email == "tu@gmail.com" && _user.Password == "456" || _user.Email == "binh@gmail.com" && _user.Password == "123")
                {
                    return RedirectToAction("Index", "LoginForm");
                }
                else
                {
                         return RedirectToAction("Index","TrangChu");
                }    
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();

        }
        [HttpPost]
        public ActionResult Register(User _user)
        {

            if (ModelState.IsValid)
            {
                var check = db.Users.FirstOrDefault(s => s.Email == _user.Email);
                if (check == null)
                {
                    db.Users.Add(_user);
                    db.SaveChanges();
                    return RedirectToAction("FormLogin");
                }
                else
                {
                    ViewBag.error = "Email đã được sử dụng, vui lòng nhập email khác";
                    return View();
                }
            }
            return View();
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(User _user)
        {
            db.Users.Add(_user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            return View(db.Users.Where(m => m.ID == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Delete(int id, User _user)
        {
            _user = db.Users.Where(m => m.ID == id).FirstOrDefault();
            db.Users.Remove(_user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            return View(db.Users.Where(m => m.ID == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Edit(int id, User _user)
        {
            _user = db.Users.SingleOrDefault(m => m.ID == id);
            db.Entry(_user).State = System.Data.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}