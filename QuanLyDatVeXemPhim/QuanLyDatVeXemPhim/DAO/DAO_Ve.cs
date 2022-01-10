using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDatVeXemPhim.DAO
{
    class DAO_Ve
    {
        moviedbEntities db;

        public DAO_Ve()
        {
            db = new moviedbEntities();
        }
        public dynamic ListVe()
        {
            dynamic ds = db.Bookings.Select(s => new
            {
                s.num,
                s.idMember,
                s.MovieID,
                s.MovieName,
                s.Showtime,
                s.Postition,
                s.Theater
            }).ToList();
            return ds;
        }

        public void deleteVe(int id)
        {
            Booking m = db.Bookings.Find(id);
            db.Bookings.Remove(m);
            db.SaveChanges();
        }

        public dynamic ListKhachhang()
        {
            dynamic ds = db.Members.Select(s => new
            {
                s.idMember,
                s.MemberName
            }).ToList();
            return ds;
        }

        public dynamic ListPhim()
        {
            dynamic ds = db.Movies.Select(s => new
            {
                s.MovieID,
                s.MovieName
            }).ToList();
            return ds;
        }

        public dynamic ListXuatchieu(int id)
        {
            dynamic ds = db.Showtimes.Where(s => s.MovieID == id).Select(s => new
            {
                s.ShowTime1,
                s.StartTime,
                s.EndTime,
                s.Theater
            }).ToList();
            return ds;
        }
        public Showtime Thoigian(int idPhim, int xuatchieu)
        {
            Showtime xc = db.Showtimes.Where(s => s.MovieID == idPhim && s.ShowTime1 == xuatchieu).FirstOrDefault();
            return xc;
        }

        public dynamic Chongoi(int idPhim, string xuatchieu)
        {
            dynamic ds = db.SelectPos.Where(s => s.MovieID == idPhim && s.Showtime == xuatchieu).Select(s => new
            {
                s.Postition
            }).ToList();
            return ds;
        }

        public void addVe(Booking book)
        {
            SelectPos selectPos = new SelectPos();
            selectPos.MovieID = book.MovieID;
            selectPos.Showtime = book.Showtime;
            selectPos.Postition = book.Postition;
            db.Bookings.Add(book);
            db.SelectPos.Add(selectPos);
            db.SaveChanges();
        }
        public string Choconguoi(int idPhim,string xuatchieu )
        {
            string chongoi;
            chongoi =  db.sp_Chodaconguoi(idPhim, xuatchieu).FirstOrDefault();
            return chongoi;
        }
        
    }
}
