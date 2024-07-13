package com.millionaire.tabs;

import com.millionaire.Calculator;
import com.millionaire.Data;
import javafx.geometry.Insets;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;

public class MainTab {

    private Calculator calculator = new Calculator();

    public Tab getTab(TabPane tabPane, double interfaceScale, ListView<String> streetsList, ListView<String> streetOwner, ListView<String> streetBuildings, CheckBox pledgeCheckBox, Label[] pledges, Data data) {
        Tab tab = new Tab();

        tab.setText("Главная");
        tab.setClosable(false);
        tab.setStyle("-fx-font-size: " + (interfaceScale * 12) + "px;");

        tab.setContent(getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data));

        return tab;
    }

    public ScrollPane getContent(double interfaceScale, TabPane tabPane, ListView<String> streetsList, ListView<String> streetOwner, ListView<String> streetBuildings, CheckBox pledgeCheckBox, Label[] pledges, Data data) {

        BorderPane tabContent = new BorderPane();

        GridPane tabGrid = new GridPane();
        tabGrid.setHgap(20*interfaceScale);
        tabGrid.setVgap(5*interfaceScale);
        tabGrid.setPadding(new Insets(5*interfaceScale));

        getTitles(tabGrid, interfaceScale);
        getStreets(tabGrid, interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, pledges, data);
        getOwners(tabGrid, interfaceScale, data);
        getRent(tabGrid, interfaceScale, data);
        getTax(tabGrid, interfaceScale, data);
        getPlayers(tabGrid, interfaceScale, data);
        getPlayersData(tabGrid, interfaceScale, data);

        tabContent.setCenter(tabGrid);

        ScrollPane scrollPane = new ScrollPane(tabContent);
        scrollPane.setFitToWidth(true);

        return scrollPane;
    }

    private void getTitles(GridPane gridPane, double interfaceScale) {
        String[] titlesText = new String[]{"Улица", "Владелец", "Аренда", "Налог", "", "Игрок", "Налог", "Акции", "Круговой доход", "Прибыль"};
        for (int i = 0; i < 10; i++) {
            Label title = new Label(titlesText[i]);
            title.setFont(new Font(16 * interfaceScale));
            if (i == 4) {
                title.setMinWidth(100 * interfaceScale);
                title.setMaxWidth(100 * interfaceScale);
            }
            gridPane.add(title, i, 0);
        }

    }

    private void getStreets(GridPane gridPane, double interfaceScale, TabPane tabPane, ListView<String> streetsList, ListView<String> streetOwner, ListView<String> streetBuildings, CheckBox pledgeCheckBox, Label[] pledges, Data data) {
        int streetNumber = 0;
        for (String name : data.getStreetTitles()) {
            Label title = new Label(name);
            title.setFont(new Font(12 * interfaceScale));

            {
                if (streetNumber >= 0 && streetNumber <= 2)
                    title.setStyle("-fx-text-fill: #AC3EE0;");
                else if (streetNumber >= 3 && streetNumber <= 4)
                    title.setStyle("-fx-text-fill: #A71E00;");
                else if (streetNumber >= 5 && streetNumber <= 7)
                    title.setStyle("-fx-text-fill: #C77700;");
                else if (streetNumber >= 8 && streetNumber <= 10)
                    title.setStyle("-fx-text-fill: #DEC800;");
                else if (streetNumber >= 11 && streetNumber <= 13)
                    title.setStyle("-fx-text-fill: #127D00;");
                else if (streetNumber >= 14 && streetNumber <= 16)
                    title.setStyle("-fx-text-fill: #00C999;");
                else if (streetNumber >= 17 && streetNumber <= 19)
                    title.setStyle("-fx-text-fill: #0094D3;");
                else if (streetNumber >= 20 && streetNumber <= 21)
                    title.setStyle("-fx-text-fill: #3056DD;");
            }

            int finalStreetNumber = streetNumber;
            title.setOnMouseClicked(event -> {
                tabPane.getSelectionModel().select(1);
                streetsList.getSelectionModel().select(finalStreetNumber);
                {
                    if (data.getOwner(finalStreetNumber) == 0)
                        streetOwner.getSelectionModel().select(0);
                    else
                        streetOwner.getSelectionModel().select(data.getOwner(finalStreetNumber));

                    if (finalStreetNumber <= 21 && !data.getPledged(finalStreetNumber)) {
                        streetBuildings.setDisable(false);
                        streetBuildings.getSelectionModel().select(data.getHouse(finalStreetNumber));
                    } else {
                        streetBuildings.setDisable(true);
                        streetBuildings.getSelectionModel().select(0);
                    }

                    Calculator calculator = new Calculator();

                    streetBuildings.setDisable(!calculator.isMonopoly(data, finalStreetNumber) || data.getPledged(finalStreetNumber));

                    pledges[0].setText(String.valueOf(calculator.getPaymentForTheStreet(data, streetsList.getSelectionModel().getSelectedIndex())));
                    pledges[1].setText(String.valueOf(calculator.getPaymentForBuildings(data, streetsList.getSelectionModel().getSelectedIndex())));
                    pledges[2].setText(String.valueOf(calculator.getTotalPayment(data, streetsList.getSelectionModel().getSelectedIndex())));
                    pledges[3].setText(String.valueOf(calculator.getRansomPrice(data, streetsList.getSelectionModel().getSelectedIndex())));

                    pledgeCheckBox.setSelected(data.getPledged(finalStreetNumber));
                }
            });
            title.getStyleClass().add("underlined-on-hover");
            gridPane.add(title, 0, streetNumber + 1);
            streetNumber++;
        }
    }

    public void getOwners(GridPane gridPane, double interfaceScale, Data data) {
        int ii = 0;
        for (Label title : new  Label[data.getOwners().length]) {
            if (!(data.getOwner(ii) == 0)) {
                title = new Label();
                title.setFont(new Font(12 * interfaceScale));
                if (data.getPledged(ii))
                    title.setStyle("-fx-text-fill: #959595;");
                if (!(data.getOwner(ii)-1 == -1))
                    title.setText(data.getPlayers()[data.getOwner(ii)-1]);
                else
                    title.setText("");
                gridPane.add(title, 1, ii + 1);
            }
            ii++;
        }
    }

    public void getRent(GridPane gridPane, double interfaceScale, Data data) {
        int streetNumber = 0;
        for (int rent = 0; rent < 26; rent++) {
            Label title = new Label();
            if (!(data.getOwner(streetNumber) == 0))
                title.setText(String.valueOf(calculator.getStreetRent(data, rent)));
            else
                title.setText("");
            title.setFont(new Font(12 * interfaceScale));

            {
                if (streetNumber >= 0 && streetNumber <= 2)
                    title.setStyle("-fx-text-fill: #AC3EE0;");
                else if (streetNumber >= 3 && streetNumber <= 4)
                    title.setStyle("-fx-text-fill: #A71E00;");
                else if (streetNumber >= 5 && streetNumber <= 7)
                    title.setStyle("-fx-text-fill: #C77700;");
                else if (streetNumber >= 8 && streetNumber <= 10)
                    title.setStyle("-fx-text-fill: #DEC800;");
                else if (streetNumber >= 11 && streetNumber <= 13)
                    title.setStyle("-fx-text-fill: #127D00;");
                else if (streetNumber >= 14 && streetNumber <= 16)
                    title.setStyle("-fx-text-fill: #00C999;");
                else if (streetNumber >= 17 && streetNumber <= 19)
                    title.setStyle("-fx-text-fill: #0094D3;");
                else if (streetNumber >= 20 && streetNumber <= 21)
                    title.setStyle("-fx-text-fill: #3056DD;");
                if (data.getPledged(streetNumber))
                    title.setStyle("-fx-text-fill: #959595;");
            }

            gridPane.add(title, 2, streetNumber + 1);
            streetNumber++;
        }
    }

    public void getTax(GridPane gridPane, double interfaceScale, Data data) {
        int streetNumber = 0;
        for (int tax = 0; tax < 26; tax++) {
            Label title = new Label();
            if (!(data.getOwner(streetNumber) == 0))
                title.setText(String.valueOf(calculator.getStreetTax(data, tax)));
            else
                title.setText("");
            title.setFont(new Font(12 * interfaceScale));

            {
                if (streetNumber >= 0 && streetNumber <= 2)
                    title.setStyle("-fx-text-fill: #AC3EE0;");
                else if (streetNumber >= 3 && streetNumber <= 4)
                    title.setStyle("-fx-text-fill: #A71E00;");
                else if (streetNumber >= 5 && streetNumber <= 7)
                    title.setStyle("-fx-text-fill: #C77700;");
                else if (streetNumber >= 8 && streetNumber <= 10)
                    title.setStyle("-fx-text-fill: #DEC800;");
                else if (streetNumber >= 11 && streetNumber <= 13)
                    title.setStyle("-fx-text-fill: #127D00;");
                else if (streetNumber >= 14 && streetNumber <= 16)
                    title.setStyle("-fx-text-fill: #00C999;");
                else if (streetNumber >= 17 && streetNumber <= 19)
                    title.setStyle("-fx-text-fill: #0094D3;");
                else if (streetNumber >= 20 && streetNumber <= 21)
                    title.setStyle("-fx-text-fill: #3056DD;");
                if (data.getPledged(streetNumber))
                    title.setStyle("-fx-text-fill: #959595;");
            }

            gridPane.add(title, 3, streetNumber + 1);
            streetNumber++;
        }
    }

    public void getPlayers(GridPane gridPane, double interfaceScale, Data data) {
        for (int i = 0; i < data.getPlayers().length; i++) {
            Label title = new Label(data.getPlayers()[i]);
            title.setFont(new Font(12 * interfaceScale));
            gridPane.add(title, 5, i+1);
        }
    }

    public void getPlayersData(GridPane gridPane, double interfaceScale, Data data) {
        for (int i = 0; i < data.getPlayers().length; i++) {
            Label tax = new Label(String.valueOf(calculator.getPlayerTotalTax(data, i)));
            tax.setFont(new Font(12 * interfaceScale));
            gridPane.add(tax, 6, i + 1);

            Label stocks = new Label(String.valueOf(calculator.getStockEarn(data, i)));
            stocks.setFont(new Font(12 * interfaceScale));
            gridPane.add(stocks, 7, i + 1);

            Label cycle = new Label();
            if ((200 + calculator.getStockEarn(data, i)) > 0) {
                cycle.setStyle("-fx-text-fill: #169A00;");
            } else if ((200 + calculator.getStockEarn(data, i)) < 0) {
                cycle.setStyle("-fx-text-fill: #CF0000;");
            }
            cycle.setText(String.valueOf(200 + calculator.getStockEarn(data, i)));
            cycle.setFont(new Font(12 * interfaceScale));
            gridPane.add(cycle, 8, i + 1);

            Label total = new Label();
            if (((200 + calculator.getStockEarn(data, i)) - calculator.getPlayerTotalTax(data, i)) > 0) {
                total.setStyle("-fx-text-fill: #169A00;");
            } else if (((200 + calculator.getStockEarn(data, i)) - calculator.getPlayerTotalTax(data, i)) < 0) {
                total.setStyle("-fx-text-fill: #CF0000;");
            }
            total.setText(String.valueOf((200 + calculator.getStockEarn(data, i)) - calculator.getPlayerTotalTax(data, i)));
            total.setFont(new Font(12 * interfaceScale));
            gridPane.add(total, 9, i + 1);
        }
    }
}
