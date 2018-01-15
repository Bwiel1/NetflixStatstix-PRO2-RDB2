package GuiFixed;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Created by Bob on 15-1-2018.
 */
public class Gui implements Runnable {
    private JPanel panelLogin;
    private JLabel nameFooter;
    private JLabel namePeople;
    private JPanel Footer;
    private JPanel buttonTabs;
    private JButton login;
    private JButton overzicht2Button;
    private JButton overzicht3Button;
    private JButton overzicht4Button;
    private JFrame frame;
    private JPanel centerMain;
    private JComboBox comboBox1;
    private JPanel resultSelectSerie;
    private JPanel selectSerie;


    public Gui(){


        login.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.setContentPane(new Gui().frame);
            }
        });
    }


    @Override
    public void run() {
        this.frame = new JFrame("Netflix Statistix");
        this.frame.setPreferredSize(new Dimension(700, 700));
        this.frame.setContentPane(new Gui().panelLogin);
        this.frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);


        this.frame.pack();
        this.frame.setVisible(true);

    }



    public JFrame getFrame() {
        return this.frame;
    }}




