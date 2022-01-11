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
    public partial class FQuanLyNhanVien : Form
    {
        BUS_NhanVien bNhanVien;
        public FQuanLyNhanVien()
        {
            InitializeComponent();
            bNhanVien = new BUS_NhanVien();
        }
        private void ListNhanVien()
        {
            gVKH.DataSource = null;
            bNhanVien.ListNhanVien(gVKH);
            gVKH.Columns[0].Width = (int)(gVKH.Width * 0.1);
            gVKH.Columns[1].Width = (int)(gVKH.Width * 0.3);
            gVKH.Columns[2].Width = (int)(gVKH.Width * 0.2);
            gVKH.Columns[3].Width = (int)(gVKH.Width * 0.3);
            gVKH.Columns[4].Width = (int)(gVKH.Width * 0.4);
            gVKH.Columns[5].Width = (int)(gVKH.Width * 0.2);
            gVKH.Columns[6].Width = (int)(gVKH.Width * 0.2);
        }


        private void FQuanlyNhanVien_Load(object sender, EventArgs e)
        {
            ListNhanVien();
        }

        private void btThem_Click(object sender, EventArgs e)
        {
            Employee m = new Employee();
            m.EmployeeName = txtTenNV.Text;
            m.Email = txtEmail.Text;
            m.BirthDate = dtNgaysinh.Value;
            m.Address = txtDiachi.Text;
            m.Gender = cbGioitinh.Text;
            m.Phone = txtDienthoai.Text;
            if (bNhanVien.AddNhanvien(m))
            {
                MessageBox.Show("Thêm nhân viên thành công!");
                ListNhanVien();
            }
            else
            {
                MessageBox.Show("Thêm nhân viên thất bại!");
            }

        }

        private void btSua_Click(object sender, EventArgs e)
        {
            Employee m = new Employee();
            m.idEmployee = int.Parse(txtMaNV.Text);
            m.EmployeeName = txtTenNV.Text;
            m.Email = txtEmail.Text;
            m.BirthDate = dtNgaysinh.Value;
            m.Address = txtDiachi.Text;
            m.Gender = cbGioitinh.Text;
            m.Phone = txtDienthoai.Text;
            if (bNhanVien.UpdateNhanvien(m))
            {
                MessageBox.Show("Sửa thông tin nhân viên thành công!");
                ListNhanVien();
            }
            else
            {
                MessageBox.Show("Sửa thông tin nhân viên thất bại!");
            }
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            int MaNV = int.Parse(gVKH.CurrentRow.Cells[0].Value.ToString());
            if (bNhanVien.DeleteNhanvien(MaNV))
            {
                MessageBox.Show("Xoá nhân viên thành công!");
                ListNhanVien();
            }
            else
            {
                MessageBox.Show("Xoá nhân viên thất bại!");
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
                                txtMaNV.Text = gVKH.Rows[e.RowIndex].Cells[0].Value.ToString();
                                break;
                            case 1:
                                txtTenNV.Text = gVKH.Rows[e.RowIndex].Cells[1].Value.ToString();
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
                                txtMaNV.Text = string.Empty;
                                break;
                            case 1:
                                txtTenNV.Text = string.Empty;
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
