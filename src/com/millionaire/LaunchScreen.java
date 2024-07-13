package com.millionaire;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.stage.Stage;

import java.util.Objects;

public class LaunchScreen {
    private final Button start = new Button("Старт");
    private TextField player1Name = new TextField();
    private TextField player2Name = new TextField();
    private TextField player3Name = new TextField();
    private TextField player4Name = new TextField();
    private TextField player5Name = new TextField();
    private TextField player6Name = new TextField();

    public Scene getScene(double interfaceScale, Stage primaryStage) {

        BorderPane borderPane = new BorderPane();

        borderPane.setCenter(getTop(interfaceScale));

        borderPane.setBottom(getBottom(interfaceScale));

        start.setOnAction(event -> {
            Data data = new Data();
            data.setPlayers(new String[]{player1Name.getText(), player2Name.getText(), player3Name.getText(), player4Name.getText(), player5Name.getText(), player6Name.getText()});
            primaryStage.setScene(new MainScreen().getScene(interfaceScale, data, primaryStage));
        });

        Scene scene = new Scene(borderPane, 300, 200);
        scene.getStylesheets().add(Objects.requireNonNull(getClass().getResource("/com/millionaire/style.css")).toExternalForm());

        return scene;

    }

    private GridPane getTop(double interfaceScale) {

        GridPane gridPane = new GridPane();

        gridPane.setHgap(5*interfaceScale);
        gridPane.setVgap(5*interfaceScale);

        gridPane.setPadding(new Insets(5*interfaceScale));

        Label enterPlayersName = new Label("Введите имена игроков:");
        enterPlayersName.setFont(new Font(12 * interfaceScale));
        GridPane.setColumnSpan(enterPlayersName, 2);
        GridPane.setRowSpan(enterPlayersName, 1);
        gridPane.add(enterPlayersName, 0, 0);

        for (int i = 1; i <= 6; i++) {
            Label Player = new Label("Игрок " + i + ": ");
            Player.setFont(new Font(12 * interfaceScale));
            gridPane.add(Player, 0, i);
        }

        player1Name = getPlayerNameTextField(interfaceScale);
        gridPane.add(player1Name, 1, 1);

        player2Name = getPlayerNameTextField(interfaceScale);
        gridPane.add(player2Name, 1, 2);

        player3Name = getPlayerNameTextField(interfaceScale);
        gridPane.add(player3Name, 1, 3);

        player4Name = getPlayerNameTextField(interfaceScale);
        gridPane.add(player4Name, 1, 4);

        player5Name = getPlayerNameTextField(interfaceScale);
        gridPane.add(player5Name, 1, 5);

        player6Name = getPlayerNameTextField(interfaceScale);
        gridPane.add(player6Name, 1, 6);

        return gridPane;
    }

    private GridPane getBottom(double interfaceScale) {

        GridPane buttonsPane = new GridPane();
        buttonsPane.setAlignment(Pos.BOTTOM_RIGHT);

        buttonsPane.setHgap(5*interfaceScale);
        buttonsPane.setVgap(5*interfaceScale);

        buttonsPane.setPadding(new Insets(5*interfaceScale));

        start.setFont(new Font(12 * interfaceScale));
        buttonsPane.add(start, 0, 0);

        return buttonsPane;

    }

    private TextField getPlayerNameTextField(double interfaceScale) {

        TextField playerName = new TextField();
        playerName.setMinWidth(200*interfaceScale);
        playerName.setFont(new Font(12 * interfaceScale));
        return playerName;

    }
}
