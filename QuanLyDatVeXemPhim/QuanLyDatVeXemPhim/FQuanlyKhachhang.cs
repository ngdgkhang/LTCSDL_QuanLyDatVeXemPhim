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
    public partial class FQuanlyKhachhang : Form
    {
        BUS_Khachhang bUS_Khachhang;
        public FQuanlyKhachhang()
        {
            InitializeComponent();
            bUS_Khachhang = new BUS_Khachhang();
        }

        private void ListKhachhang()
        {
            gVKH.DataSource = null;
            bUS_Khachhang.ListKhachhang(gVKH);
            gVKH.Columns[0].Width = (int)(gVKH.Width * 0.1);
            gVKH.Columns[1].Width = (int)(gVKH.Width * 0.3);
            gVKH.Columns[2].Width = (int)(gVKH.Width * 0.2);
            gVKH.Columns[3].Width = (int)(gVKH.Width * 0.3);
            gVKH.Columns[4].Width = (int)(gVKH.Width * 0.4);
            gVKH.Columns[5].Width = (int)(gVKH.Width * 0.2);
            gVKH.Columns[6].Width = (int)(gVKH.Width * 0.2);
        }


        private void FQuanlyKhachhang_Load(object sender, EventArgs e)
        {
            ListKhachhang();
        }

        private void btThem_Click(object sender, EventArgs e)
        {
            Member m = new Member();
            m.MemberName = txtTenKH.Text;
            m.Email = txtEmail.Text;
            m.BirthDate = dtNgaysinh.Value;
            m.Address = txtDiachi.Text;
            m.Gender = cbGioitinh.Text;
            m.Phone = txtDienthoai.Text;
            if(bUS_Khachhang.AddKhachhang(m))
            {
                MessageBox.Show("Thêm khách hàng thành công!");
                ListKhachhang();
            }
            else
            {
                MessageBox.Show("Thêm khách hàng thất bại!");
            } 
                
        }

        private void btSua_Click(object sender, EventArgs e)
        {
            Member m = new Member();
            m.MemberName = txtTenKH.Text;
            m.Email = txtEmail.Text;
            m.BirthDate = dtNgaysinh.Value;
            m.Address = txtDiachi.Text;
            m.Gender = cbGioitinh.Text;
            m.Phone = txtDienthoai.Text;
            if (bUS_Khachhang.UpdateKhachhang(m))
            {
                MessageBox.Show("Sửa thông tin khách hàng thành công!");
                ListKhachhang();
            }
            else
            {
                MessageBox.Show("Sửa thông tin khách hàng thất bại!");
            }
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            int MaKH = int.Parse(gVKH.CurrentRow.Cells[0].Value.ToString());
            if (bUS_Khachhang.DeleteKhachhang(MaKH))
            {
                MessageBox.Show("Xoá khách hàng thành công!");
                ListKhachhang();
            }
            else
            {
                MessageBox.Show("Xoá khách hàng thất bại!");
            }
        }

        private void gVKH_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.RowIndex < gVKH.Rows.Count)
            {
                for (int i = 0; i < 7; i++)
                {
                    if (gVKH.Rows[e.RowIndex].Cells[i].Value != null && !string.IsNullOrWhiteSpace(gVKH.Rows[e.RowIndex].Cells[i].Value.ToString()))
                    {
                        switch (i)
                        {
                            case 0:
                                txtMaKH.Text = gVKH.Rows[e.RowIndex].Cells[0].Value.ToString();
                                break;
                            case 1:
                                txtTenKH.Text = gVKH.Rows[e.RowIndex].Cells[1].Value.ToString();
                                break;
                            case 2:
                                txtDienthoai.Text = gVKH.Rows[e.RowIndex].Cells[2].Value.ToString();
                                break;
                            case 3:
                                txtEmail.Text = gVKH.Rows[e.RowIndex].Cells[3].Value.ToString();
                                break;
                            case 4:
                                txtDiachi.Text = gVKH.Rows[e.RowIndex].Cells[4].Value.ToString();
                                break;
                            case 5:
                                dtNgaysinh.Text = gVKH.Rows[e.RowIndex].Cells[5].Value.ToString();
                                break;
                            case 6:
                                cbGioitinh.Text = gVKH.Rows[e.RowIndex].Cells[6].Value.ToString();
                                break;
                        }
                    }
                    else
                    {
                        switch (i)
                        {
                            case 0:
                                txtMaKH.Text = string.Empty;
                                break;
                            case 1:
                                txtTenKH.Text = string.Empty;
                                break;
                            case 2:
                                txtDienthoai.Text = string.Empty;
                                break;
                            case 3:
                                txtEmail.Text = string.Empty;
                                break;
                            case 4:
                                txtDiachi.Text = string.Empty;
                                break;
                            case 5:
                                dtNgaysinh.Text = string.Empty;
                                break;
                            case 6:
                                cbGioitinh.Text = string.Empty;
                                break;
                        }
                    }
                }
            }
        }
    }
}
