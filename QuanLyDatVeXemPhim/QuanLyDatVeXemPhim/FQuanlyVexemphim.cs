using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyDatVeXemPhim.BUS;

namespace QuanLyDatVeXemPhim
{
    public partial class FQuanlyVexemphim : Form
    {
        BUS_Ve bUS_Ve;
        bool flat = false;
        string vitringoi = null;
        int idmovie = 0;
        public FQuanlyVexemphim()
        {
            InitializeComponent();
            bUS_Ve = new BUS_Ve();
        }
        private void ListVe()
        {
            gVVe.DataSource = null;
            bUS_Ve.ListVe(gVVe);
            gVVe.Columns[0].Width = (int)(gVVe.Width * 0.1);
            gVVe.Columns[1].Width = (int)(gVVe.Width * 0.1);
            gVVe.Columns[2].Width = (int)(gVVe.Width * 0.1);
            gVVe.Columns[3].Width = (int)(gVVe.Width * 0.4);
            gVVe.Columns[4].Width = (int)(gVVe.Width * 0.4);
            gVVe.Columns[5].Width = (int)(gVVe.Width * 0.2);
            gVVe.Columns[6].Width = (int)(gVVe.Width * 0.1);
        }
        private void FQuanlyVexemphim_Load(object sender, EventArgs e)
        {
            ListVe();
            bUS_Ve.ListKhachhang(cbTenKH);
            bUS_Ve.ListPhim(cbPhim);
            flat = true;
            cbChongoi.Enabled = false;
        }

        private void gVVe_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string[] xuatchieu;
            if (e.RowIndex >= 0 && e.RowIndex < gVVe.Rows.Count)
            {
                try
                {
                    cbTenKH.Text = gVVe.Rows[e.RowIndex].Cells[1].Value.ToString();
                    txtMaphim.Text = gVVe.Rows[e.RowIndex].Cells[2].Value.ToString();
                    cbPhim.Text = gVVe.Rows[e.RowIndex].Cells[3].Value.ToString();
                    xuatchieu = (gVVe.Rows[e.RowIndex].Cells[4].Value.ToString()).Split(',',' ');
                    cbXuatchieu.Text = xuatchieu[2].Substring(0,1);
                    txtStarttime.Text = xuatchieu[3];
                    txtEndtime.Text = xuatchieu[5];
                    cbChongoi.Text = gVVe.Rows[e.RowIndex].Cells[5].Value.ToString();
                    txtRap.Text = gVVe.Rows[e.RowIndex].Cells[6].Value.ToString();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            int id = int.Parse(gVVe.CurrentRow.Cells[0].Value.ToString());
            if (bUS_Ve.DeleteVe(id))
            {
                MessageBox.Show("Xoá phim thành công!");
                ListVe();
            }
            else
            {
                MessageBox.Show("Xoá phim thất bại!");
            }
        }

        private void cbPhim_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (flat) idmovie = int.Parse(cbPhim.SelectedValue.ToString());
            bUS_Ve.ListXuatchieu(cbXuatchieu,idmovie);
            txtMaphim.Text = idmovie.ToString();
            cbChongoi.Enabled = false;
        }

        private void cbXuatchieu_SelectedIndexChanged(object sender, EventArgs e)
        {
            Showtime xc;
            int xuatchieu, phim;
            if (flat)
            {
                xuatchieu = int.Parse(cbXuatchieu.SelectedValue.ToString());
                phim = int.Parse(cbPhim.SelectedValue.ToString());
                xc = bUS_Ve.Thoigian(phim, xuatchieu);
                txtRap.Text = xc.Theater.ToString();
                txtStarttime.Text = xc.StartTime.ToString();
                txtEndtime.Text = xc.EndTime.ToString();
                Loadchongoi();
                
            }    
        }

        private void btThem_Click(object sender, EventArgs e)
        {
            if (vitringoi == null) MessageBox.Show("Vui lòng không để trống chỗ ngồi!");
            else
            {
                Booking book = new Booking();
                book.idMember = int.Parse(cbTenKH.SelectedValue.ToString());
                book.MovieID = int.Parse(txtMaphim.Text);
                book.MovieName = cbPhim.Text.ToString();
                book.idMember = int.Parse(cbTenKH.SelectedValue.ToString());
                book.Postition = vitringoi;
                book.Showtime = "Xuất chiếu " + cbXuatchieu.SelectedValue.ToString() + ": " + txtStarttime.Text + " - " + txtEndtime.Text;
                book.Theater = int.Parse(txtRap.Text.ToString());
                if (bUS_Ve.AddVe(book))
                {
                    MessageBox.Show("Thêm vé thành công!");
                    ListVe();
                    Loadchongoi();
                    vitringoi = null;
                }
                else
                {
                    MessageBox.Show("Thêm vé thất bại!");
                }
            }
        }

        private void cbChongoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            string showtime = "Xuất chiếu " + cbXuatchieu.SelectedValue.ToString() + ": " + txtStarttime.Text + " - " + txtEndtime.Text;
            if (bUS_Ve.Choconguoi(int.Parse(cbPhim.SelectedValue.ToString()), showtime) == null)
                vitringoi = cbChongoi.SelectedItem.ToString();
            else
            {
                if (bUS_Ve.Choconguoi(int.Parse(cbPhim.SelectedValue.ToString()), showtime).Contains(cbChongoi.SelectedItem.ToString()))
                {
                    MessageBox.Show("Chỗ ngồi đã có người khác đặt! Vui lòng chọn vị trí khác!");
                }
                else vitringoi = cbChongoi.SelectedItem.ToString();
            }
           
        }   
        private void Loadchongoi()
        {
           
            string chongoi = null;
            Regex trimmer = new Regex(@"\s\s+");
            string showtime = "Xuất chiếu " + cbXuatchieu.SelectedValue.ToString() + ": " + txtStarttime.Text + " - " + txtEndtime.Text;
            if (bUS_Ve.Choconguoi(int.Parse(cbPhim.SelectedValue.ToString()), showtime) != null)
            {
                chongoi = bUS_Ve.Choconguoi(int.Parse(cbPhim.SelectedValue.ToString()), showtime).ToString();
            }
            else chongoi = "Chưa có khách hàng đặt vé!";
            txtChoconguoi.Text = trimmer.Replace(chongoi, " ");
        }

        private void cbPhim_SelectionChangeCommitted(object sender, EventArgs e)
        {
            cbXuatchieu.Enabled = true;
            cbChongoi.Enabled = false;
        }

        private void cbXuatchieu_SelectedValueChanged(object sender, EventArgs e)
        {
            cbChongoi.Enabled = true;
        }
    }
}
