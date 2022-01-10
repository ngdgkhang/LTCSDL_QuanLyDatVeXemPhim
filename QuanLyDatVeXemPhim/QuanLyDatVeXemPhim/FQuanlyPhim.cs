using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyDatVeXemPhim.BUS;

namespace QuanLyDatVeXemPhim
{
    public partial class FQuanlyPhim : Form
    {
        BUS_Phim bUS_Phim;
        public FQuanlyPhim()
        {
            InitializeComponent();
            bUS_Phim = new BUS_Phim();
        }

        private void FQuanlyPhim_Load(object sender, EventArgs e)
        {
            ListPhims();
        }

        private void ListPhims()
        {
            gVPhim.DataSource = null;
            bUS_Phim.ListPhim(gVPhim);
            gVPhim.Columns[0].Width = (int)(gVPhim.Width * 0.1);
            gVPhim.Columns[1].Width = (int)(gVPhim.Width * 0.3);
            gVPhim.Columns[2].Width = (int)(gVPhim.Width * 0.2);
            gVPhim.Columns[3].Width = (int)(gVPhim.Width * 0.4);
            gVPhim.Columns[4].Width = (int)(gVPhim.Width * 0.15);
            gVPhim.Columns[5].Width = (int)(gVPhim.Width * 0.1);
            gVPhim.Columns[6].Width = (int)(gVPhim.Width * 0.1);
        }

        private void gVPhim_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.RowIndex < gVPhim.Rows.Count)
            {
                try
                {
                    txtMaphim.Text = gVPhim.Rows[e.RowIndex].Cells[0].Value.ToString();
                    txtTenPhim.Text = gVPhim.Rows[e.RowIndex].Cells[1].Value.ToString();
                    txtDienvien.Text = gVPhim.Rows[e.RowIndex].Cells[3].Value.ToString();
                    txtTheloai.Text = gVPhim.Rows[e.RowIndex].Cells[2].Value.ToString();
                    dtNgaykhoichieu.Text = gVPhim.Rows[e.RowIndex].Cells[4].Value.ToString();
                    txtDodai.Text = gVPhim.Rows[e.RowIndex].Cells[5].Value.ToString();
                    txtDotuoi.Text = gVPhim.Rows[e.RowIndex].Cells[6].Value.ToString();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void btThem_Click(object sender, EventArgs e)
        {
            Movy movies = new Movy();
            movies.MovieName = txtTenPhim.Text;
            movies.Cast = txtDienvien.Text;
            movies.Category = txtTheloai.Text;
            movies.ReleaseDate = dtNgaykhoichieu.Value;
            movies.RunningTime = txtDodai.Text;
            movies.Rate = txtDotuoi.Text;
            if (bUS_Phim.AddPhim(movies))
            {
                MessageBox.Show("Thêm phim thành công!");
                ListPhims();
            }
            else
            {
                MessageBox.Show("Thêm phim thất bại!");
            }
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            int id = int.Parse(gVPhim.CurrentRow.Cells[0].Value.ToString());
            if (bUS_Phim.DeletePhim(id))
            {
                MessageBox.Show("Xoá phim thành công!");
                ListPhims();
            }
            else
            {
                MessageBox.Show("Xoá phim thất bại!");
            }
        }

        private void btSua_Click(object sender, EventArgs e)
        {
            Movy movies = new Movy();
            movies.MovieID = int.Parse(txtMaphim.Text);
            movies.MovieName = txtTenPhim.Text;
            movies.Cast = txtDienvien.Text;
            movies.Category = txtTheloai.Text;
            movies.ReleaseDate = dtNgaykhoichieu.Value;
            movies.RunningTime = txtDodai.Text;
            movies.Rate = txtDotuoi.Text;
            if (bUS_Phim.UpdatePhim(movies))
            {
                MessageBox.Show("Sửa phim thành công!");
                ListPhims();
            }
            else
            {
                MessageBox.Show("Sửa phim thất bại!");
            }
        }
    }
}
