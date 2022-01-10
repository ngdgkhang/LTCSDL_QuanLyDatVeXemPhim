using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDatVeXemPhim.DAO
{
    class DAO_Phim
    {
        moviedbEntities db;
        public DAO_Phim()
        {
            db = new moviedbEntities();
        }

        public dynamic ListPhim()
        {
            dynamic ds = db.Movies.Select(s => new
            {
                s.MovieID,
                s.MovieName,
                s.Category,
                s.Cast,
                s.ReleaseDate,
                s.RunningTime,
                s.Rate
            }).ToList();
            return ds;
        }
        public void addPhim(Movy m)
        {
            db.Movies.Add(m);
            db.SaveChanges();
        }
        public void deletePhim(int id)
        {
            Movy m = db.Movies.Find(id);
            db.Movies.Remove(m);
            db.SaveChanges();
        }
        public void updatePhim(Movy m)
        {
            Movy movie = db.Movies.Find(m.MovieID);
            movie.MovieName = m.MovieName;
            movie.Rate = m.Rate;
            movie.Cast = m.Cast;
            movie.Category = m.Category;
            movie.ReleaseDate = m.ReleaseDate;
            movie.RunningTime = m.RunningTime;
            db.SaveChanges();
        }


    }
}
