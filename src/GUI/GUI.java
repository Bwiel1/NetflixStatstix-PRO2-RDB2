package GUI;

import javax.swing.*;
import java.awt.*;

public class GUI implements Runnable {

    private JFrame frame;

    @Override
    public void run() {
        this.frame = new JFrame("Netflix Statistix");
        this.frame.setPreferredSize(new Dimension(500, 700));

        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        createComponents(frame.getContentPane());

        frame.pack();
        frame.setVisible(true);
    }

    private void createComponents(Container container) {
        BorderLayout layout = new BorderLayout();
        container.setLayout(layout);
        container.setBackground(Color.red);

        container.add(createButtons(), BorderLayout.WEST );
        container.add(footer(), BorderLayout.SOUTH);
    }

    private static JPanel createButtons(){
        JPanel panel = new JPanel(new GridLayout(6,1));

        JButton getData = new JButton("Get the data now!");
        JButton getFixed = new JButton("Fix it");
        JButton getShit = new JButton("Just amazing");
        getData.setPreferredSize(new Dimension(100,0));
        getFixed.setPreferredSize(new Dimension(100,0));
        getShit.setPreferredSize(new Dimension(100,0));


        panel.add(getData);
        panel.add(getFixed);
        panel.add(getShit);

        return panel;
    }

    private JPanel footer(){
        JPanel panel = new JPanel(new BorderLayout());
        JLabel firstText = new JLabel("Netflix Statistix");
        JLabel secondText = new JLabel("2017 23IVT1D Stef Michielsen Stephan de Wit Bob van de Wiel");
        panel.add(firstText, BorderLayout.WEST);
        panel.add(secondText, BorderLayout.EAST);

        return panel;
    }

    public JFrame getFrame() {
        return frame;
    }
}
