package com.millionaire.tabs;

import com.millionaire.Calculator;
import com.millionaire.Data;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;

public class EditStreetTab {
    public ListView<String> streetsList = new ListView<>();
    public ListView<String> streetOwner = new ListView<>();
    public ListView<String> streetBuildings = new ListView<>();
    private CheckBox pledgeCheckBox = new CheckBox("Заложена");
    private Label paymentForTheStreet = new Label("0");
    private Label paymentForBuildings = new Label("0");
    private Label totalPayment = new Label("0");
    private Label ransomPrice = new Label("0");

    private Calculator calculator = new Calculator();

    public Tab getTab(TabPane tabPane, double interfaceScale, Data data) {
        Tab tab = new Tab();

        tab.setText("Редактировать улицу");
        tab.setClosable(false);
        tab.setStyle("-fx-font-size: " + (interfaceScale * 12) + "px;");

        ScrollPane scrollPane = new ScrollPane(getContent(interfaceScale, tabPane, data));
        scrollPane.setFitToWidth(true);
        scrollPane.setFitToHeight(true);

        tab.setContent(scrollPane);

        return tab;
    }

    private BorderPane getContent(double interfaceScale, TabPane tabPane, Data data) {
        BorderPane tabContent = new BorderPane();

        SplitPane splitPane = new SplitPane();
        splitPane.getItems().addAll(getLeftGridPane(interfaceScale, data), getRightGridPane(interfaceScale, data, tabPane));
        splitPane.setDividerPosition(0, 0.5);

        tabContent.setCenter(splitPane);

        tabContent.setBottom(getBottomGridPane(interfaceScale, tabPane));

        return tabContent;
    }

    private GridPane getLeftGridPane(double interfaceScale, Data data) {

        streetsList = new ListView<>();

        GridPane gridPane = new GridPane();
        gridPane.setHgap(5 * interfaceScale);
        gridPane.setVgap(5 * interfaceScale);
        gridPane.setPadding(new Insets(5 * interfaceScale));

        Label title = new Label("Улица:");
        title.setFont(new Font(14 * interfaceScale));
        gridPane.add(title, 0, 0);

        streetsList.setStyle("-fx-background-color: #333;");

        ObservableList<String> items = FXCollections.observableArrayList(data.getStreetTitles());
        streetsList.setItems(items);

        streetsList.setCellFactory(param -> new ListCell<String>() {
            @Override
            protected void updateItem(String item, boolean empty){
                super.updateItem(item, empty);
                int streetLabelNumber = getIndex();
                String size = "-fx-font-size: " + (interfaceScale * 12) + "px;";
                {
                    if (streetLabelNumber >= 0 && streetLabelNumber <= 2)
                        setStyle("-fx-text-fill: #AC3EE0;" + size);
                    else if (streetLabelNumber >= 3 && streetLabelNumber <= 4)
                        setStyle("-fx-text-fill: #A71E00;" + size);
                    else if (streetLabelNumber >= 5 && streetLabelNumber <= 7)
                        setStyle("-fx-text-fill: #C77700;" + size);
                    else if (streetLabelNumber >= 8 && streetLabelNumber <= 10)
                        setStyle("-fx-text-fill: #DEC800;" + size);
                    else if (streetLabelNumber >= 11 && streetLabelNumber <= 13)
                        setStyle("-fx-text-fill: #127D00;" + size);
                    else if (streetLabelNumber >= 14 && streetLabelNumber <= 16)
                        setStyle("-fx-text-fill: #00C999;" + size);
                    else if (streetLabelNumber >= 17 && streetLabelNumber <= 19)
                        setStyle("-fx-text-fill: #0094D3;" + size);
                    else if (streetLabelNumber >= 20 && streetLabelNumber <= 21)
                        setStyle("-fx-text-fill: #3056DD;" + size);
                    else
                        setStyle("-fx-text-fill: #FAFAFA;" + size);
                }
                if (empty)
                    getStyleClass().add("listItemsCustomUnhover");
                else
                    getStyleClass().add("listItemsCustom");
                setText(item);
                setOnMouseClicked(event -> {
                    if (data.getOwner(streetLabelNumber) == 0)
                        streetOwner.getSelectionModel().select(0);
                    else
                        streetOwner.getSelectionModel().select(data.getOwner(streetLabelNumber));

                    if (streetLabelNumber <= 21 && !data.getPledged(streetLabelNumber)) {
                        streetBuildings.setDisable(false);
                        streetBuildings.getSelectionModel().select(data.getHouse(streetLabelNumber));
                    } else {
                        streetBuildings.setDisable(true);
                        streetBuildings.getSelectionModel().select(0);
                    }

                    streetBuildings.setDisable(!calculator.isMonopoly(data, streetsList.getSelectionModel().getSelectedIndex()) || data.getPledged(streetsList.getSelectionModel().getSelectedIndex()));

                    paymentForTheStreet.setText(String.valueOf(calculator.getPaymentForTheStreet(data, streetsList.getSelectionModel().getSelectedIndex())));
                    paymentForBuildings.setText(String.valueOf(calculator.getPaymentForBuildings(data, streetsList.getSelectionModel().getSelectedIndex())));
                    totalPayment.setText(String.valueOf(calculator.getTotalPayment(data, streetsList.getSelectionModel().getSelectedIndex())));
                    ransomPrice.setText(String.valueOf(calculator.getRansomPrice(data, streetsList.getSelectionModel().getSelectedIndex())));

                    pledgeCheckBox.setSelected(data.getPledged(streetLabelNumber));
                });
            }
        });

        gridPane.add(streetsList, 0, 1);

        GridPane.setHgrow(streetsList, javafx.scene.layout.Priority.ALWAYS);
        GridPane.setVgrow(streetsList, javafx.scene.layout.Priority.ALWAYS);

        return gridPane;
    }

    private GridPane getRightGridPane(double interfaceScale, Data data, TabPane tabPane) {
        GridPane gridPane = new GridPane();
        gridPane.setHgap(5 * interfaceScale);
        gridPane.setVgap(5 * interfaceScale);
        gridPane.setPadding(new Insets(5 * interfaceScale));

        {
            Label title = new Label("Владелец:");
            title.setFont(new Font(14 * interfaceScale));
            gridPane.add(title, 0, 0);
        }

        {
            Label title = new Label("Постройки:");
            title.setFont(new Font(14 * interfaceScale));
            gridPane.add(title, 0, 2);
        }

        {
            Label title = new Label("Заложенность:");
            title.setFont(new Font(14 * interfaceScale));
            gridPane.add(title, 0, 4);
        }

        pledgeCheckBox.setFont(new Font(12 * interfaceScale));

        pledgeCheckBox.setOnAction(event -> {
            if (pledgeCheckBox.isSelected()) {
                if (streetsList.getSelectionModel().getSelectedIndex() <= 21)
                    data.setHouse(0, streetsList.getSelectionModel().getSelectedIndex());
                paymentForBuildings.setText("0");
                streetBuildings.getSelectionModel().select(0);
                streetBuildings.setDisable(true);
                data.setPledged(true, streetsList.getSelectionModel().getSelectedIndex());
                if (streetsList.getSelectionModel().getSelectedIndex() <= 21)
                    data.setHouse(0, streetsList.getSelectionModel().getSelectedIndex());
            } else {
                streetBuildings.setDisable(false);
                data.setPledged(false, streetsList.getSelectionModel().getSelectedIndex());
            }

            streetBuildings.setDisable(!calculator.isMonopoly(data, streetsList.getSelectionModel().getSelectedIndex()) || data.getPledged(streetsList.getSelectionModel().getSelectedIndex()));

            paymentForTheStreet.setText(String.valueOf(calculator.getPaymentForTheStreet(data, streetsList.getSelectionModel().getSelectedIndex())));
            paymentForBuildings.setText(String.valueOf(calculator.getPaymentForBuildings(data, streetsList.getSelectionModel().getSelectedIndex())));
            totalPayment.setText(String.valueOf(calculator.getTotalPayment(data, streetsList.getSelectionModel().getSelectedIndex())));
            ransomPrice.setText(String.valueOf(calculator.getRansomPrice(data, streetsList.getSelectionModel().getSelectedIndex())));

            tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, new Label[]{paymentForTheStreet, paymentForBuildings, totalPayment, ransomPrice}, data));
        });

        setupStreetOwnerList(interfaceScale, data, tabPane);
        setupStreetBuildingsList(interfaceScale, data, tabPane);

        gridPane.add(streetOwner, 0, 1);
        gridPane.add(streetBuildings, 0, 3);
        gridPane.add(pledgeCheckBox, 0, 5);
        gridPane.add(getPledgeGrid(interfaceScale), 0, 6);

        return gridPane;
    }

    private GridPane getBottomGridPane(double interfaceScale, TabPane tabPane) {
        GridPane gridPane = new GridPane();
        gridPane.setAlignment(Pos.BOTTOM_RIGHT);
        gridPane.setHgap(5 * interfaceScale);
        gridPane.setVgap(5 * interfaceScale);
        gridPane.setPadding(new Insets(5 * interfaceScale));

        Button OKButton = new Button("OK");
        OKButton.setFont(new Font(12 * interfaceScale));
        OKButton.setOnAction(e -> tabPane.getSelectionModel().select(0));
        gridPane.add(OKButton, 0, 0);

        return gridPane;
    }

    private void setupStreetOwnerList(double interfaceScale, Data data, TabPane tabPane) {
        streetOwner = new ListView<>();

        String[] owners = new String[data.getPlayers().length+1];
        owners[0] = "Нет владельца";

        for (int i = 1; i < owners.length; i++) {
            owners[i] = data.getPlayers()[i-1];
        }

        ObservableList<String> items = FXCollections.observableArrayList(owners);

        streetOwner.setStyle("-fx-background-color: #333;");
        streetOwner.setItems(items);

        streetOwner.setCellFactory(param -> new ListCell<String>() {
            @Override
            protected void updateItem(String item, boolean empty){
                super.updateItem(item, empty);
                setStyle("-fx-text-fill: #FAFAFA;" + "-fx-font-size: " + (interfaceScale * 12) + "px;");
                if (empty)
                    getStyleClass().add("listItemsCustomUnhover");
                else
                    getStyleClass().add("listItemsCustom");
                setText(item);
                setOnMouseClicked(event -> {
                    data.setOwner(getIndex(), streetsList.getSelectionModel().getSelectedIndex());
                    paymentForTheStreet.setText(String.valueOf(calculator.getPaymentForTheStreet(data, streetsList.getSelectionModel().getSelectedIndex())));
                    paymentForBuildings.setText(String.valueOf(calculator.getPaymentForBuildings(data, streetsList.getSelectionModel().getSelectedIndex())));
                    totalPayment.setText(String.valueOf(calculator.getTotalPayment(data, streetsList.getSelectionModel().getSelectedIndex())));
                    ransomPrice.setText(String.valueOf(calculator.getRansomPrice(data, streetsList.getSelectionModel().getSelectedIndex())));
                    streetBuildings.setDisable(!calculator.isMonopoly(data, streetsList.getSelectionModel().getSelectedIndex()) || data.getPledged(streetsList.getSelectionModel().getSelectedIndex()));
                    tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, new Label[]{paymentForTheStreet, paymentForBuildings, totalPayment, ransomPrice}, data));
                });
            }
        });

        streetOwner.setMinHeight(160 * interfaceScale);
        streetOwner.setMaxHeight(160 * interfaceScale);

        GridPane.setHgrow(streetOwner, javafx.scene.layout.Priority.ALWAYS);
    }

    private void setupStreetBuildingsList(double interfaceScale, Data data, TabPane tabPane) {
        streetBuildings = new ListView<>();

        ObservableList<String> items = FXCollections.observableArrayList("Нет построек", "1 Филиал", "2 Филиала", "3 Филиала", "Отель");

        streetBuildings.setStyle("-fx-background-color: #333;");
        streetBuildings.setItems(items);

        streetBuildings.setCellFactory(param -> new ListCell<String>() {
            @Override
            protected void updateItem(String item, boolean empty){
                super.updateItem(item, empty);
                setStyle("-fx-text-fill: #FAFAFA;" + "-fx-font-size: " + (interfaceScale * 12) + "px;");
                if (empty)
                    getStyleClass().add("listItemsCustomUnhover");
                else
                    getStyleClass().add("listItemsCustom");
                setText(item);
                if (streetsList.getSelectionModel().getSelectedIndex() <= 21)
                    setOnMouseClicked(event -> {
                        data.setHouse(getIndex(), streetsList.getSelectionModel().getSelectedIndex());
                        paymentForTheStreet.setText(String.valueOf(calculator.getPaymentForTheStreet(data, streetsList.getSelectionModel().getSelectedIndex())));
                        paymentForBuildings.setText(String.valueOf(calculator.getPaymentForBuildings(data, streetsList.getSelectionModel().getSelectedIndex())));
                        totalPayment.setText(String.valueOf(calculator.getTotalPayment(data, streetsList.getSelectionModel().getSelectedIndex())));
                        ransomPrice.setText(String.valueOf(calculator.getRansomPrice(data, streetsList.getSelectionModel().getSelectedIndex())));
                        tabPane.getTabs().get(0).setContent(new MainTab().getContent(interfaceScale, tabPane, streetsList, streetOwner, streetBuildings, pledgeCheckBox, new Label[]{paymentForTheStreet, paymentForBuildings, totalPayment, ransomPrice}, data));
                    });
            }
        });

        streetBuildings.setMinHeight(125 * interfaceScale);
        streetBuildings.setMaxHeight(125 * interfaceScale);

        GridPane.setHgrow(streetBuildings, javafx.scene.layout.Priority.ALWAYS);
    }

    private GridPane getPledgeGrid(double interfaceScale) {
        GridPane gridPane = new GridPane();
        gridPane.setHgap(5 * interfaceScale);
        gridPane.setVgap(5 * interfaceScale);
        gridPane.setPadding(new Insets(5 * interfaceScale));

        Label l1 = new Label("Выплата за улицу:");
        Label l2 = new Label("Выплата за постройки:");
        Label l3 = new Label("Суммарная выплата:");
        Label l4 = new Label("Стоимость выкупа:");
        l1.setFont(new Font(12 * interfaceScale));
        l2.setFont(new Font(12 * interfaceScale));
        l3.setFont(new Font(12 * interfaceScale));
        l4.setFont(new Font(12 * interfaceScale));
        gridPane.add(l1, 0, 0);
        gridPane.add(l2, 0, 1);
        gridPane.add(l3, 0, 2);
        gridPane.add(l4, 0, 3);

        paymentForTheStreet.setFont(new Font(12 * interfaceScale));
        paymentForBuildings.setFont(new Font(12 * interfaceScale));
        totalPayment.setFont(new Font(12 * interfaceScale));
        ransomPrice.setFont(new Font(12 * interfaceScale));

        gridPane.add(paymentForTheStreet, 1, 0);
        gridPane.add(paymentForBuildings, 1, 1);
        gridPane.add(totalPayment, 1, 2);
        gridPane.add(ransomPrice, 1, 3);

        GridPane.setHgrow(gridPane, javafx.scene.layout.Priority.ALWAYS);

        return gridPane;
    }

    public ListView<String> getStreetsList() {
        return streetsList;
    }

    public ListView<String> getStreetOwner() {
        return streetOwner;
    }

    public ListView<String> getStreetBuildings() {
        return streetBuildings;
    }

    public CheckBox getPledgeCheckBox() {
        return pledgeCheckBox;
    }

    public Label[] getPledges() {
        return new Label[]{paymentForTheStreet, paymentForBuildings, totalPayment, ransomPrice};
    }
}
