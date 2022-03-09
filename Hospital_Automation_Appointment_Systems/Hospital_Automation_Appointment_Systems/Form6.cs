using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Hospital_Automation_Appointment_Systems
{
    public partial class Form6 : Form
    {
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class
        public Form6()
        {
            InitializeComponent();
        }
        public string username;
        private void Form6_Load(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PoliklinikVeriGetir";

            SqlDataReader dr;

            baglanti.Open();
            dr = komut.ExecuteReader();
            while (dr.Read())
            {
                comboBox3.Items.Add(dr["PoliklinikNo"]);
            }


            baglanti.Close();

            //**********************************************


            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorlarVeriGetir";
            SqlDataReader dd;
            baglanti.Open();
            dd = komut.ExecuteReader();
            while (dd.Read())
            {
                if (dd["DoktorAdSoyad"].ToString() == username)
                {
                    string no = (dd["DoktorNo"].ToString());
                    label10.Text = no;
                    string name = (dd["DoktorAdSoyad"].ToString());
                    label13.Text = name;
                    string tcno = (dd["TC"].ToString());
                    textBox2.Text = tcno;
                    string uzmanlik = (dd["UzmanlikAlani"].ToString());
                    comboBox1.Text = uzmanlik;
                    string title = (dd["Unvan"].ToString());
                    comboBox2.Text = title;
                    string tel = (dd["Telefon"].ToString());
                    maskedTextBox1.Text = tel;
                    string address = (dd["Adres"].ToString());
                    textBox1.Text = address;
                    string date = (dd["DogumTarihi"].ToString());
                    maskedTextBox2.Text = date;
                    string pol= (dd["PoliklinikNo"].ToString());
                    comboBox3.Text = pol;
                    string user = (dd["UserNo"].ToString());
                    label14.Text = user;
                }

            }
            baglanti.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorDataUpdate";
            baglanti.Open();
            komut.Parameters.AddWithValue("DoktorAdSoyad",label13.Text);
            komut.Parameters.AddWithValue("TC", textBox2.Text);
            komut.Parameters.AddWithValue("UzmanlikAlani",comboBox1.Text);
            komut.Parameters.AddWithValue("Unvan",comboBox2.Text);
            komut.Parameters.AddWithValue("Telefon",maskedTextBox1.Text);
            komut.Parameters.AddWithValue("Adres",textBox1.Text);
            komut.Parameters.AddWithValue("PoliklinikNo",comboBox3.Text);
            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Sayın " + label13.Text + " yapmış olduğunuz değişiklikler başarıyla kaydedilmiştir.");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form7 form7 = new Form7();
            form7.doktorNo = Convert.ToInt32(label10.Text);
            form7.Show();
            this.Hide();
        }
    }
}

