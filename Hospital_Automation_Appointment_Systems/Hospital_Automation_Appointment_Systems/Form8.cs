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
    public partial class Form8 : Form
    {
        public Form8()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class
        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select *From Users where UserName=@p1 and User_Password=@p2 and (UserTitle='Yönetici' or UserTitle='Yonetici')", baglanti);
            komut.Parameters.AddWithValue("@p1", textBox1.Text);
            komut.Parameters.AddWithValue("@p2", textBox2.Text);
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                Form4 form4 = new Form4();
                form4.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Sayın"+textBox1+"Kullanıcı adı veya şifre hatalı. IT birimi ile iletişime geçiniz.");
            }
            baglanti.Close();
        }
           

        private void button2_Click(object sender, EventArgs e)
        {
            Form1 form1=new Form1();
            form1.Show();
            this.Hide();
        }

        private void Form8_Load(object sender, EventArgs e)
        {

        }
    }
}
