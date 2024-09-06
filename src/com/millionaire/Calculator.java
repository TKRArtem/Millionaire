package com.millionaire;

public class Calculator {
    public int getPaymentForTheStreet(Data data, int street) {
        return data.getStreetPrice(street)/2;
    }

    public int getPaymentForBuildings(Data data, int street) {
        if (street <= 21)
            return (data.getHouse(street)*data.getStreetBuildingPrice(street))/2;
        else
            return 0;
    }

    public int getStockEarn(Data data, int player) {
        int earn = 0;
        earn = data.getStockPrice() * data.getPlayerStock(player);
        if (data.isFortuneAdded("Доход от акций, выплачиваемый на клетке \"Старт\" возрастает до 50 процентов за каждую акцию"))
            return (int) (earn * 0.5);
        else
            return (int) (earn * 0.2);
    }

    public int getStockTax(Data data, int player) {
        if (data.isFortuneAdded("Налог с акций при прохождении клетки \"Налоговая инспекция\" устанавливается в размере 50 фантов за акцию"))
            return 50*data.getPlayerStock(player);
        else
            return 10*data.getPlayerStock(player);
    }

    public int getPlayerTotalTax(Data data, int player) {
        int tax = 0;
        for (int i = 0; i <= 21; i++) {
            if (data.getOwner(i)==player+1) {
                int tax_ = getStreetTax(data, i);
                tax_ = getStreetTaxAfterFortune(data, tax_, i);
                if (data.getPledged(i))
                    tax_ = 0;
                tax += tax_;
            }
        }
        {
            int tax_ = 0;

            int playerCenterStreetsAmount = getPlayerCenterStreetsAmount(data, player);
            for (int i = 22; i < 26; i++) {
                if (data.getPledged(i) && data.getOwner(i)-1 == player)
                    playerCenterStreetsAmount--;
            }

            switch (playerCenterStreetsAmount) {
                case 1:
                    tax_ = 10;
                    break;
                case 2:
                    tax_ = 40;
                    break;
                case 3:
                    tax_ = 80;
                    break;
                case 4:
                    tax_ = 100;
                    break;
            }

            if (data.isFortuneAdded("Все участки центральной отрасли облагаются двойным налогом"))
                tax_ *= 2;

            tax += tax_;
        }
        tax += getStockTax(data, player);
        return tax;
    }

    public int getTotalPayment(Data data, int street) {
        return getPaymentForTheStreet(data, street) + getPaymentForBuildings(data, street);
    }

    public int getRansomPrice(Data data, int street) {
        return (data.getStreetPrice(street)/2) + ((int) (((double) (data.getStreetPrice(street))) * 0.1));
    }

    public boolean isMonopoly(Data data, int street) {
        if (data.getOwner(street) == 0)
            return false;

        if (street >= 0 && street <= 2) {
            return data.getOwner(0) == data.getOwner(1) && data.getOwner(1) == data.getOwner(2);
        } else if (street >= 3 && street <= 4) {
            return data.getOwner(3) == data.getOwner(4);
        } else if (street >= 5 && street <= 7) {
            return data.getOwner(5) == data.getOwner(6) && data.getOwner(6) == data.getOwner(7);
        } else if (street >= 8 && street <= 10) {
            return data.getOwner(8) == data.getOwner(9) && data.getOwner(9) == data.getOwner(10);
        } else if (street >= 11 && street <= 13) {
            return data.getOwner(11) == data.getOwner(12) && data.getOwner(12) == data.getOwner(13);
        } else if (street >= 14 && street <= 16) {
            return data.getOwner(14) == data.getOwner(15) && data.getOwner(15) == data.getOwner(16);
        } else if (street >= 17 && street <= 19) {
            return data.getOwner(17) == data.getOwner(18) && data.getOwner(18) == data.getOwner(19);
        } else if (street >= 20 && street <= 21) {
            return data.getOwner(20) == data.getOwner(21);
        }

        return false;
    }

    public int getPlayerCenterStreetsAmount(Data data, int player) {
        int amount = 0;
        for (int i = 0; i < 4; i++) {
            if (data.getOwner(22+i) == player+1)
                amount++;
        }
        return amount;
    }

    public int getStreetRent(Data data, int street) {
        int rent = 0;

        if (street <= 21) {
            rent = data.getRentBase(street);
            if (isMonopoly(data, street)) {
                switch (data.getHouse(street)) {
                    case 0:
                        rent *= 2;
                        break;
                    case 1:
                        rent *= 4;
                        break;
                    case 2:
                        rent *= 6;
                        break;
                    case 3:
                        rent *= 8;
                        break;
                    case 4:
                        rent *= 10;
                        break;
                }
            }
        } else {
            switch (getPlayerCenterStreetsAmount(data, data.getOwner(street)-1)) {
                case 1:
                    rent = 30;
                    break;
                case 2:
                    rent = 100;
                    break;
                case 3:
                    rent = 200;
                    break;
                case 4:
                    rent = 500;
                    break;
            }
        }

        rent = getStreetRentAfterFortune(data, rent, street);

        return rent;
    }

    public int getStreetTax(Data data, int street) {
        int tax = 0;

        if (street <= 21) {
            tax = data.getTaxBase(street);
            if (isMonopoly(data, street)) {
                switch (data.getHouse(street)) {
                    case 0:
                        tax *= 2;
                        break;
                    case 1:
                        tax *= 3;
                        break;
                    case 2:
                        tax *= 4;
                        break;
                    case 3:
                        tax *= 5;
                        break;
                    case 4:
                        tax *= 6;
                        break;
                }
            }
        } else {
            int playerCenterStreetsAmount = getPlayerCenterStreetsAmount(data, data.getOwner(street)-1);
            for (int i = 22; i < 26; i++) {
                if (data.getPledged(i) && data.getOwner(i) == data.getOwner(street))
                    playerCenterStreetsAmount--;
            }
            switch (playerCenterStreetsAmount) {
                case 1:
                    tax = 10;
                    break;
                case 2:
                    tax = 40;
                    break;
                case 3:
                    tax = 80;
                    break;
                case 4:
                    tax = 100;
                    break;
            }
        }

        tax = getStreetTaxAfterFortune(data, tax, street);

        return tax;
    }

    public int getStreetRentAfterFortune(Data data, int currentPrice, int street) {
        for (String fortune: data.fortunes) {
            switch (fortune) {
                case "Всем первым участкам устанавливается аренда - 3 фанта":
                    if (street == 0 || street == 3 || street == 5 || street == 8 || street == 11 || street == 14 || street == 17 || street == 20)
                        currentPrice = 3;
                    break;
                case "Всем третьим участкам устанавливается аренда - 10 фантов":
                    if (street == 2 || street == 7 || street == 10 || street == 13 || street == 16 || street == 19)
                        currentPrice = 10;
                    break;
                case "Всем третьим участкам устанавливается аренда - 20 фантов":
                    if (street == 2 || street == 7 || street == 10 || street == 13 || street == 16 || street == 19)
                        currentPrice = 20;
                    break;
                case "Всем участкам отрасли \"Тяжёлая промышленность\" устанавливается аренда - 10 фантов":
                    if (street >= 17 && street <= 19)
                        currentPrice = 10;
                    break;
                case "Всем участка отрасли \"Пищевая промышленность\" устанавливатся аренда - 50 фантов":
                    if (street >= 3 && street <= 4)
                        currentPrice = 50;
                    break;
                case "Всем участкам центральной отрасли устанавливается аренда - 0 фантов":
                    if (street >= 22 && street <= 25)
                        currentPrice = 0;
                    break;
                case "Всем участкам отрасли \"Средства массовой информации\" устанавливается аренда - 0 фантов":
                    if (street >= 11 && street <= 13)
                        currentPrice = 0;
                    break;
                case "Всем третьим участкам устанавливается аренда - 0 фантов":
                    if (street == 2 || street == 7 || street == 10 || street == 13 || street == 16 || street == 19)
                        currentPrice = 0;
                    break;
                case "Всем вторым участкам устанавливается аренда - 20 фантов":
                    if (street == 1 || street == 4 || street == 6 || street == 9 || street == 12 || street == 15 || street == 18 || street == 21)
                        currentPrice = 20;
                    break;
                case "Всем участкам отрасли \"Средства массовой информации\" устанавливается аренда - 100 фантов":
                    if (street >= 11 && street <= 13)
                        currentPrice = 100;
                    break;
            }
        }
        return currentPrice;
    }

    public int getStreetTaxAfterFortune(Data data, int currentPrice, int street) {
        for (String fortune: data.fortunes) {
            switch (fortune) {
                case "Все участки отрасли \"Добывающая промышленность\" облагаются налогом - 20 фантов":
                    if (street >= 20 && street <= 21)
                        currentPrice = 20;
                    break;
                case "Все третьи участки освобождаются от налога":
                    if (street == 2 || street == 7 || street == 10 || street == 13 || street == 16 || street == 19)
                        currentPrice = 0;
                    break;
                case "Все участки отрасли \"Тяжёлая промышленность\" облагаются налогом - 50 фантов":
                    if (street >= 17 && street <= 19)
                        currentPrice = 50;
                    break;
                case "Все вторые участки освобождаются от налога":
                    if (street == 1 || street == 4 || street == 6 || street == 9 || street == 12 || street == 15 || street == 18 || street == 21)
                        currentPrice = 0;
                    break;
                case "Все участки отрасли \"Средства массовой информации\" освобождаются от налога":
                    if (street >= 11 && street <= 13)
                        currentPrice = 0;
                    break;
                case "Все участки отрасли \"Связь и коммуникации\" освобождаются от налога":
                    if (street >= 5 && street <= 7)
                        currentPrice = 0;
                    break;
                case "Все участки центральной отрасли облагаются двойным налогом":
                    if (street >= 22 && street <= 25)
                        currentPrice *= 2;
                    break;
                case "Все участки отрасли \"Пищевая промышленность\" освобождаются от налога":
                    if (street >= 3 && street <= 4)
                        currentPrice = 0;
                    break;
                case "Все участки отрасли \"Добывающая промышленность\" облагаются двойным налогом":
                    if (street >= 20 && street <= 21)
                        currentPrice *= 2;
                    break;
                case "Все участки отрасли \"Лёгкая промышленность\" освобождаются от налога":
                    if (street >= 8 && street <= 10)
                        currentPrice = 0;
                    break;
                case "Все участки Транспортной отрасли освобождаются от налога":
                    if (street >= 14 && street <= 16)
                        currentPrice = 0;
                    break;
                case "Все третьи участки облагаются двойным налогом":
                    if (street == 2 || street == 7 || street == 10 || street == 13 || street == 16 || street == 19)
                        currentPrice *= 2;
                    break;
            }
        }
        return currentPrice;
    }
}
