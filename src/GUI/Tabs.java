package GUI;

import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;

import static javax.swing.SwingConstants.LEFT;

public class Tabs extends JPanel {
    public Tabs(){
        super(new GridLayout(1,1));

        //Aangezien Java Swing geen methode heeft voor de grootte van een tab
        //gebruiken we een losse label als dimensie voor de tab
        JLabel tab1 = new JLabel();
        JLabel tab2 = new JLabel();
        JLabel tab3 = new JLabel();

        DynamicResizer test1 = new DynamicResizer();

        tab1.setPreferredSize(new Dimension(400, 60));
        tab1.setText("Profiel 1");
        tab2.setPreferredSize(new Dimension(Toolkit.getDefaultToolkit().getScreenSize()));
        tab2.setText("Profiel 2");
        tab3.setPreferredSize(new Dimension(400, 60));
        tab3.setText("Profiel 3");


        JTabbedPane tabbedPane = new JTabbedPane();
        tabbedPane.setTabPlacement(LEFT);
        JComponent panel1 = makePanel("Panel 1");
        tabbedPane.addTab("Tab 1", null, panel1, "Doet nog niks");
        tabbedPane.setMnemonicAt(0, KeyEvent.VK_1);
        tabbedPane.setTabComponentAt(0, tab1);

        JComponent panel2 = makePanel("Panel 2");
        tabbedPane.addTab("Tab 2", null, panel2, "Doet nog niks");
        tabbedPane.setMnemonicAt(1, KeyEvent.VK_2);
        tabbedPane.setTabComponentAt(1, tab2);

        JComponent panel3 = makePanel("Panel 3");
        tabbedPane.addTab("Tab 3", null, panel3, "Doet nog niks");
        tabbedPane.setMnemonicAt(2, KeyEvent.VK_3);
        tabbedPane.setTabComponentAt(2, tab3);
        add(tabbedPane);

        tabbedPane.setTabLayoutPolicy(JTabbedPane.SCROLL_TAB_LAYOUT);
        tabbedPane.setBackground(Color.green);

    }

    protected JComponent makePanel(String text){
        JPanel panel = new JPanel(false);
        JLabel filler = new JLabel(text);
        filler.setHorizontalAlignment(JLabel.CENTER);
        panel.setLayout(new GridLayout(1, 1));
        panel.add(filler);
        return panel;
    }

}
