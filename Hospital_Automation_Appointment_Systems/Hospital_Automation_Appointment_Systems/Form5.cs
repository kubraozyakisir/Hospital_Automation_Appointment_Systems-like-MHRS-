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
    public partial class Form5 : Form
    {
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class
        public Form5()
        {
            InitializeComponent();
        }
        public string username;
        public void Listele()
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;  
            komut.CommandText = "ListToNameOfPatient";  
            SqlDataAdapter goruntule = new SqlDataAdapter(komut);
            DataTable dt = new DataTable(); 
            goruntule.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        public void RandevuGoruntule()
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure; 
            komut.CommandText = "RandevuGoruntule"; 
            komut.Parameters.AddWithValue("HastaNo",label12.Text);
            SqlDataAdapter goruntule = new SqlDataAdapter(komut);
            DataTable dt = new DataTable(); 
            goruntule.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private void Form5_Load(object sender, EventArgs e)
        {
            label20.Visible = false;
            textBox3.Visible = false;
            button5.Visible = false;    
            panel1.Visible = false;
            label18.Text = username;  

            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PoliklinikVeriGetir";

            SqlDataReader dr;

            baglanti.Open();
            dr = komut.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["PoliklinikNo"]);
            }


            baglanti.Close();

            //**********************************************


            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorlarVeriGetir";

            SqlDataReader de;

            baglanti.Open();
            de = komut.ExecuteReader();
            while (de.Read())
            {
                comboBox2.Items.Add(de["DoktorNo"]);
            }
            baglanti.Close();

            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaVeriGetir";
            SqlDataReader dd;
            baglanti.Open();
            dd = komut.ExecuteReader();
            while (dd.Read())
            {
                if (dd["HastaAdSoyad"].ToString() == username)
                {
                    string no = (dd["HastaNo"].ToString());
                    label12.Text = no;
                    string name = (dd["HastaAdSoyad"].ToString());
                    label13.Text = name;
                    string tcno = (dd["TcNo"].ToString());
                    label14.Text = tcno;
                    string date = (dd["DogumTarihi"].ToString());
                    label15.Text = date;
                    string boy = (dd["Boy"].ToString());
                    textBox1.Text = boy;
                    string kilo = (dd["Kilo"].ToString());
                    textBox2.Text = kilo;
                    string yas = (dd["Yas"].ToString());
                    label16.Text = yas;
                }

            }
            baglanti.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
            label20.Visible = false;
          //  textBox3.Visible = false;
            button5.Visible = true;
            RandevuGoruntule();
        }
        private void button3_Click(object sender, EventArgs e)  
        {
           
            SqlCommand komut = new SqlCommand();
            baglanti.Open();
          
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;  
            komut.CommandText = "RandevuAl"; 

            komut.Parameters.AddWithValue("HastaNo", label12.Text);
            komut.Parameters.AddWithValue("HastaTC", label14.Text);
            komut.Parameters.AddWithValue("HastaAdiSoyadi", label13.Text);
            komut.Parameters.AddWithValue("DoktorNo", comboBox2.Text);
            komut.Parameters.AddWithValue("PoliklinikNo", comboBox1.Text);
            komut.Parameters.AddWithValue("RandevuTarihi", dateTimePicker1.Value);
            DateTime new_zaman = DateTime.Parse(maskedTextBox1.Text);
            TimeSpan ts = new_zaman.TimeOfDay;
            komut.Parameters.AddWithValue("RandevuSaati", ts);
            try
            {
                komut.ExecuteNonQuery();
  
                  MessageBox.Show("Randevunu Kaydedilmiştir.");
                 RandevuGoruntule();
            }
            catch
            {
                MessageBox.Show("Randevu DOLU !..");
            }
            baglanti.Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaVeriGuncelleme";
            baglanti.Open();  
            komut.Parameters.AddWithValue("HastaAdSoyad", label13.Text);
            komut.Parameters.AddWithValue("Boy", textBox1.Text);
            komut.Parameters.AddWithValue("Kilo", textBox2.Text);
            komut.ExecuteNonQuery();
            MessageBox.Show("Sayın " + label13.Text + "; Güncelleme Başarılı Bir Şekilde Gerçekleşmiştir.");
            baglanti.Close();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;

            textBox3.Text = row.Cells[0].Value.ToString();
            comboBox1.Text = row.Cells[4].Value.ToString();
            comboBox2.Text = row.Cells[3].Value.ToString();
            //dateTimePicker1.Value = Convert.ToDateTime(row.Cells[5].Value.ToString());
            maskedTextBox1.Text = row.Cells[6].Value.ToString();
           

        }

        private void button5_Click(object sender, EventArgs e)
        { 
            
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "RandevuSil";
            baglanti.Open();
           
            int id = Convert.ToInt32(textBox3.Text); 
            komut.Parameters.AddWithValue("Hasta_Randevu_ID",id);
           
            int dc = komut.ExecuteNonQuery();
            if (dc>0)
            {
                MessageBox.Show("Sayın " + label13.Text + "; Silme Başarılı Bir Şekilde Gerçekleşmiştir.");
            }
            else
            {
                MessageBox.Show("Silme İşlemi Başarısız.");
            }
            
            baglanti.Close();
            RandevuGoruntule();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            RandevuGoruntule();
        }
    }
}
