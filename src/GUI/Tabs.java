package GUI;

import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;

import static javax.swing.SwingConstants.LEFT;

public class Tabs extends JPanel {
    public Tabs(){
        super(new GridLayout(1,1));

        JTabbedPane tabbedPane = new JTabbedPane();
        tabbedPane.setTabPlacement(LEFT);
        JComponent panel1 = makePanel("Panel 1");
        tabbedPane.addTab("Tab 1", null, panel1, "Doet nog niks");
        tabbedPane.setMnemonicAt(0, KeyEvent.VK_1);

        JComponent panel2 = makePanel("Panel 2");
        tabbedPane.addTab("Tab 2", null, panel2, "Doet nog niks");
        tabbedPane.setMnemonicAt(0, KeyEvent.VK_2);

        JComponent panel3 = makePanel("Panel 3");
        tabbedPane.addTab("Tab 3", null, panel3, "Doet nog niks");
        tabbedPane.setMnemonicAt(0, KeyEvent.VK_3);
        add(tabbedPane);

        tabbedPane.setTabLayoutPolicy(JTabbedPane.SCROLL_TAB_LAYOUT);

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
