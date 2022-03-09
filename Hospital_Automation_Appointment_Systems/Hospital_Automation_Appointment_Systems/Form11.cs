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
    public partial class Form11 : Form
    {
        public Form11()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sectim = dataGridView1.SelectedCells[0].RowIndex;

            textBox1.Text = dataGridView1.Rows[sectim].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sectim].Cells[1].Value.ToString();
            maskedTextBox1.Text = dataGridView1.Rows[sectim].Cells[2].Value.ToString();
            comboBox2.Text = dataGridView1.Rows[sectim].Cells[3].Value.ToString();
            comboBox1.Text = dataGridView1.Rows[sectim].Cells[4].Value.ToString();
            maskedTextBox3.Text = dataGridView1.Rows[sectim].Cells[5].Value.ToString();
            textBox3.Text = dataGridView1.Rows[sectim].Cells[6].Value.ToString();
            maskedTextBox2.Text = dataGridView1.Rows[sectim].Cells[7].Value.ToString();
            comboBox3.Text = dataGridView1.Rows[sectim].Cells[8].Value.ToString();
            textBox4.Text = dataGridView1.Rows[sectim].Cells[9].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "UpdateDoktorsfromUsers";
            komut.Parameters.AddWithValue("@DoktorNo", textBox1.Text);
            komut.Parameters.AddWithValue("@DoktorAdSoyad", textBox2.Text);
            komut.Parameters.AddWithValue("@TC", maskedTextBox1.Text);
            komut.Parameters.AddWithValue("@uzmanlikAlani", comboBox2.Text);
            komut.Parameters.AddWithValue("@Unvan", comboBox1.Text);
            komut.Parameters.AddWithValue("@Telefon", maskedTextBox3.Text);
            komut.Parameters.AddWithValue("@Adres", textBox3.Text);
            komut.Parameters.AddWithValue("@DogumTarihi", maskedTextBox2.Text);
            komut.Parameters.AddWithValue("@PoliklinikNo", comboBox3.Text);
            komut.Parameters.AddWithValue("@UserNo", textBox4.Text);


            SqlDataAdapter goruntule = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();  
            goruntule.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "SearchDoktorsfromUsers";
            komut.Parameters.AddWithValue("@DoktorNo", textBox5.Text);

            SqlDataAdapter goruntule = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();  
            goruntule.Fill(dt);
            dataGridView1.DataSource = dt;
            baglanti.Close();


        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form4 form4 = new Form4();
            form4.Show();
            this.Hide();
        }

        private void Form11_Load(object sender, EventArgs e)
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
            //****************************************
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorlarVeriGetir";
            SqlDataReader dd;
            baglanti.Open();
            dd = komut.ExecuteReader();
            while (dd.Read())
            {
                comboBox2.Items.Add(dd["UzmanlikAlani"]);
                comboBox1.Items.Add(dd["Unvan"]);

            }
            baglanti.Close();
        }

    
        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "AddDoctorfromUsers";
            komut.Parameters.AddWithValue("@DoktorAdSoyad", textBox2.Text);
            komut.Parameters.AddWithValue("@TC", maskedTextBox1.Text);
            komut.Parameters.AddWithValue("@uzmanlikAlani", comboBox2.Text);
            komut.Parameters.AddWithValue("@Unvan", comboBox1.Text);
            komut.Parameters.AddWithValue("@Telefon", maskedTextBox3.Text);
            komut.Parameters.AddWithValue("@Adres", textBox3.Text);
            DateTime birthdate = DateTime.Parse(maskedTextBox2.Text);
            komut.Parameters.AddWithValue("@DogumTarihi", birthdate);
            komut.Parameters.AddWithValue("@PoliklinikNo", comboBox3.Text);
            komut.ExecuteNonQuery();
            MessageBox.Show("Doktor  " + textBox2.Text + " Başarıyla eklenmiştir.");
            baglanti.Close();

        }
    }
}
