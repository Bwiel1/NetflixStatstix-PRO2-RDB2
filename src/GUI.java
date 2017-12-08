import javax.swing.*;
import java.awt.*;

public class GUI implements Runnable {

    private JFrame frame;

    @Override
    public void run() {
        this.frame = new JFrame("Netflix Statistix");
        this.frame.setPreferredSize(new Dimension(500, 300));

        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        createComponents(frame.getContentPane());

        frame.pack();
        frame.setVisible(true);
    }

    private void createComponents(Container container) {
        BorderLayout layout = new BorderLayout();
        container.setLayout(layout);
        container.setBackground(Color.red);

        container.add(createButtons(), BorderLayout.WEST);
        container.add(footer(), BorderLayout.SOUTH);
    }

    private JPanel createButtons(){
        JPanel panel = new JPanel(new GridLayout(3,1));
        Dimension d = new Dimension(100,50);
        panel.add(new JButton("First"));
        panel.add(new JButton("First"));
        panel.add(new JButton("First"));

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
