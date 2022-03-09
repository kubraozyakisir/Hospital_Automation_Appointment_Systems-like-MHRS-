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
    public partial class Form9 : Form
    {
        public Form9()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class
        private void Form9_Load(object sender, EventArgs e)
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
                comboBox2.Items.Add(dr["PoliklinikNo"]);
                comboBox4.Items.Add(dr["Poliklinik_Name"]);
                
              
            }
            baglanti.Close();
            //****************************************
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorlarVeriGetir";
            SqlDataReader dd;
            baglanti.Open();
            dd = komut.ExecuteReader();
            while (dd.Read())
            {
                comboBox3.Items.Add(dd["DoktorAdSoyad"]);
                comboBox5.Items.Add(dd["DoktorAdSoyad"]);

            }
            baglanti.Close();

            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "toGetManagerNo";
            SqlDataReader de;
            baglanti.Open();
            de = komut.ExecuteReader();
            while (de.Read())
            {
                comboBox1.Items.Add(de["ManagerID"]);

            }
            baglanti.Close();
        }
    
        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            baglanti.Open();
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = " PoliklinikDelete";
            komut.Parameters.AddWithValue("PoliklinikNo", comboBox6.Text);
            SqlDataReader dc;
            dc = komut.ExecuteReader();
            if (dc.Read())
            {
                MessageBox.Show("Poliklinik Başarıyla Silinmiştir.");
            }
            else
            {
                MessageBox.Show("Silme İşlemi Başarısız.");
            }
            baglanti.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            baglanti.Open();
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PoliklinikUpdate";
            komut.Parameters.AddWithValue("PoliklinikNo", comboBox6.Text);
            SqlDataReader de;
            de = komut.ExecuteReader();
            if (de.Read())
            {
                MessageBox.Show("Poliklinik Başarıyla Güncellenmiştir.");
            }
            else
            {
                MessageBox.Show("Güncelleme İşlemi Başarısız.");
            }
            baglanti.Close();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
             
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            baglanti.Open();
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PoliklinikEkle";
            komut.Parameters.AddWithValue("ManagerNo", comboBox1.Text);
            komut.Parameters.AddWithValue("Poliklinik_Name", comboBox4.Text);
            komut.Parameters.AddWithValue("Poliklinik_Expert_Number", textBox1.Text);
            komut.Parameters.AddWithValue("Poliklinik_President", comboBox3.Text);
            komut.Parameters.AddWithValue("Poliklinik_FirstNurse", comboBox5.Text);
            komut.Parameters.AddWithValue("Bed_Numbers", textBox2.Text);
            komut.ExecuteNonQuery(); 
            MessageBox.Show("Poliklinik Eklenmiştir.");
            baglanti.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form4 form4 = new Form4();
            form4.Show();
            this.Hide();
        }
    }
}
