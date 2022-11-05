using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfApp1.Windows;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void logwinBtn_Click(object sender, RoutedEventArgs e)
        {
            Windows.RegWindow regWindow = new Windows.RegWindow();
            this.Hide();
            regWindow.Show();
        }

        private void passTB_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void submitBTN_Click(object sender, RoutedEventArgs e)
        {
            using (Models.ParfumeriaEntities db = new Models.ParfumeriaEntities())
            {
                var user = db.Users.FirstOrDefault(x => x.login == logTB.Text &&
                                                      x.password == passTB.Text);
                if (user != null)
                {

                    Windows.SpisokTovarovWindow stWindow = new Windows.SpisokTovarovWindow();
                    stWindow.Show();
                    return;
                }
                MessageBox.Show("Пройдите регистрацию!");
                Windows.SpisokTovarovWindow spisokTovarovWindow = new Windows.SpisokTovarovWindow();
                this.Hide();
                spisokTovarovWindow.Show();

            }
        }
    }
}
