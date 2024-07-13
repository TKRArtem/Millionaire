package com.millionaire.tabs;

import com.millionaire.Data;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;

public class StocksTab {
    public Tab getTab(double interfaceScale, Data data, TabPane tabPane, ListView<String> streetsList, ListView<String> streetOwner, ListView<String> streetBuildings, CheckBox pledgeCheckBox, Label[] pledges) {
        Tab tab = new Tab();

        tab.setText("Акции");
        tab.setClosable(false);
        tab.setStyle("-fx-font-size: " + (interfaceScale * 12) + "px;");

        tab.setContent(getContent(interfaceScale, data, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges));

        return tab;
    }

    private BorderPane getContent(double interfaceScale, Data data, TabPane tabPane, ListView<String> streetsList, ListView<String> streetOwner, ListView<String> streetBuildings, CheckBox pledgeCheckBox, Label[] pledges) {
        BorderPane tabContent = new BorderPane();

        GridPane gridPane = new GridPane();
        gridPane.setHgap(5 * interfaceScale);
        gridPane.setVgap(5 * interfaceScale);
        gridPane.setPadding(new javafx.geometry.Insets(5 * interfaceScale));

        Label title = new Label("Акции:");
        title.setFont(new Font(16 * interfaceScale));
        gridPane.add(title, 0, 0);

        Label stockSumLabel = new Label("Стоимость одной акции: ");
        stockSumLabel.setFont(new Font(12 * interfaceScale));
        gridPane.add(stockSumLabel, 0, 1);

        TextField stockSumField = new TextField();
        stockSumField.setMinWidth(200*interfaceScale);
        stockSumField.setMaxWidth(200*interfaceScale);
        stockSumField.setFont(new Font(12 * interfaceScale));
        restrictToNumericInput(stockSumField);
        stockSumField.setText(String.valueOf(data.getStockPrice()));
        stockSumField.textProperty().addListener((observable, oldValue, newValue) -> {
            data.setStockPrice(Integer.parseInt(stockSumField.getText()));
            tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
        });
        gridPane.add(stockSumField, 1, 1);

        Label title2 = new Label("Акции игроков:");
        title2.setFont(new Font(16 * interfaceScale));
        gridPane.add(title2, 0, 2);

        TextField player1 = new TextField();
        TextField player2 = new TextField();
        TextField player3 = new TextField();
        TextField player4 = new TextField();
        TextField player5 = new TextField();
        TextField player6 = new TextField();

        getFields(data, interfaceScale, gridPane, player1, player2, player3, player4, player5, player6, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges);

        tabContent.setCenter(gridPane);

        return tabContent;
    }

    private void getFields(Data data, double interfaceScale, GridPane gridPane, TextField player1, TextField player2, TextField player3, TextField player4, TextField player5, TextField player6,
            TabPane tabPane, ListView<String> streetsList, ListView<String> streetOwner, ListView<String> streetBuildings, CheckBox pledgeCheckBox, Label[] pledges) {
        if (data.getPlayers().length > 0) {
            player1.setMinWidth(200*interfaceScale);
            player1.setMaxWidth(200*interfaceScale);
            player1.setFont(new Font(12 * interfaceScale));
            restrictToNumericInput(player1);
            player1.setText(String.valueOf(data.getPlayerStock(0)));
            player1.textProperty().addListener((observable, oldValue, newValue) -> {
                try {
                    data.setPlayerStock(0, Integer.parseInt(player1.getText()));
                } catch (NumberFormatException e) {
                    data.setPlayerStock(0, 0);
                }
                tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
            });
            gridPane.add(player1, 1, 3);
            Label label = new Label(data.getPlayers()[0]+":" );
            label.setFont(new Font(12 * interfaceScale));
            gridPane.add(label, 0, 3);
        }
        if (data.getPlayers().length > 1) {
            player2.setMinWidth(200*interfaceScale);
            player2.setMaxWidth(200*interfaceScale);
            player2.setFont(new Font(12 * interfaceScale));
            restrictToNumericInput(player2);
            player2.setText(String.valueOf(data.getPlayerStock(1)));
            player2.textProperty().addListener((observable, oldValue, newValue) -> {
                try {
                    data.setPlayerStock(1, Integer.parseInt(player2.getText()));
                } catch (NumberFormatException e) {
                    data.setPlayerStock(1, 0);
                }
                tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
            });
            gridPane.add(player2, 1, 4);
            Label label = new Label(data.getPlayers()[1]+":");
            label.setFont(new Font(12 * interfaceScale));
            gridPane.add(label, 0, 4);
        }
        if (data.getPlayers().length > 2) {
            player3.setMinWidth(200*interfaceScale);
            player3.setMaxWidth(200*interfaceScale);
            player3.setFont(new Font(12 * interfaceScale));
            restrictToNumericInput(player3);
            player3.setText(String.valueOf(data.getPlayerStock(2)));
            player3.textProperty().addListener((observable, oldValue, newValue) -> {
                try {
                    data.setPlayerStock(2, Integer.parseInt(player3.getText()));
                } catch (NumberFormatException e) {
                    data.setPlayerStock(2, 0);
                }
                tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
            });
            gridPane.add(player3, 1, 5);
            Label label = new Label(data.getPlayers()[2]+":");
            label.setFont(new Font(12 * interfaceScale));
            gridPane.add(label, 0, 5);
        }
        if (data.getPlayers().length > 3) {
            player4.setMinWidth(200*interfaceScale);
            player4.setMaxWidth(200*interfaceScale);
            player4.setFont(new Font(12 * interfaceScale));
            restrictToNumericInput(player4);
            player4.setText(String.valueOf(data.getPlayerStock(3)));
            player4.textProperty().addListener((observable, oldValue, newValue) -> {
                try {
                    data.setPlayerStock(3, Integer.parseInt(player4.getText()));
                } catch (NumberFormatException e) {
                    data.setPlayerStock(3, 0);
                }
                tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
            });
            gridPane.add(player4, 1, 6);
            Label label = new Label(data.getPlayers()[3]+":");
            label.setFont(new Font(12 * interfaceScale));
            gridPane.add(label, 0, 6);
        }
        if (data.getPlayers().length > 4) {
            player5.setMinWidth(200*interfaceScale);
            player5.setMaxWidth(200*interfaceScale);
            player5.setFont(new Font(12 * interfaceScale));
            restrictToNumericInput(player5);
            player5.setText(String.valueOf(data.getPlayerStock(4)));
            player5.textProperty().addListener((observable, oldValue, newValue) -> {
                try {
                    data.setPlayerStock(4, Integer.parseInt(player5.getText()));
                } catch (NumberFormatException e) {
                    data.setPlayerStock(4, 0);
                }
                tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
            });
            gridPane.add(player5, 1, 7);
            Label label = new Label(data.getPlayers()[4]+":");
            label.setFont(new Font(12 * interfaceScale));
            gridPane.add(label, 0, 7);
        }
        if (data.getPlayers().length > 5) {
            player6.setMinWidth(200*interfaceScale);
            player6.setMaxWidth(200*interfaceScale);
            player6.setFont(new Font(12 * interfaceScale));
            restrictToNumericInput(player6);
            player6.setText(String.valueOf(data.getPlayerStock(5)));
            player6.textProperty().addListener((observable, oldValue, newValue) -> {
                try {
                    data.setPlayerStock(5, Integer.parseInt(player6.getText()));
                } catch (NumberFormatException e) {
                    data.setPlayerStock(5, 0);
                }
                tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));
            });
            gridPane.add(player6, 1, 8);
            Label label = new Label(data.getPlayers()[5]+":");
            label.setFont(new Font(12 * interfaceScale));
            gridPane.add(label, 0, 8);
        }
    }

    private void restrictToNumericInput(TextField textField) {
        textField.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                textField.setText(oldValue);
            }
        });
    }
}
