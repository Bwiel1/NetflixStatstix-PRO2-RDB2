package GuiFixed;

import oracle.jrockit.jfr.JFR;

import javax.swing.*;
import java.awt.*;

/**
 * Created by Bob on 15-1-2018.
 */
public class Gui implements Runnable {
    private JPanel panelMain;
    private JLabel nameFooter;
    private JLabel namePeople;
    private JPanel Footer;
    private JPanel buttonTabs;
    private JButton overzicht1Button;
    private JButton overzicht2Button;
    private JButton overzicht3Button;
    private JButton overzicht4Button;
    private JPanel centerMain;
    private JComboBox comboBox1;
    private JPanel selectSerie;
    private JPanel resultSelectSerie;
    private JFrame frame;

    public Gui(){

    }

    @Override
    public void run() {
        this.frame = new JFrame("Netflix Statistix");
        this.frame.setPreferredSize(new Dimension(700, 700));
        this.frame.setContentPane(new Gui().panelMain);

        this.frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);


        this.frame.pack();
        this.frame.setVisible(true);

    }



    public JFrame getFrame() {
        return this.frame;
    }
}

