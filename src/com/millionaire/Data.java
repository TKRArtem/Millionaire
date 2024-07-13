package com.millionaire;

import java.util.ArrayList;

public class Data {
    private final String[] streetTitles = {
            "Кинотеатр", "Казино", "Ночной клуб", "Шоколадная фабрика", "Пивоваренный завод", "Интернет-провайдер",
            "Пейджинговая компания", "Оператор сотовой связи", "Обувная фабрика", "Мебельное производство",
            "Швейное объединение", "Издательский дом", "Радиостанция", "Телевизионная компания",
            "Железнодорожное предприятие", "Морское пароходство", "Авиокомпания", "Автомобильный завод",
            "Судостроительный завод", "Металлургический комбинат", "Угольный синдикат", "Нефтяной холдинг", "Машина",
            "Самолёт", "Яхта", "Поезд"
    };

    private final String[] availableFortunes = {
            "Всем первым участкам устанавливается аренда - 3 фанта",
            "Все участки отрасли \"Добывающая промышленность\" облагаются налогом - 20 фантов",
            "Всем третьим участкам устанавливается аренда - 10 фантов",
            "Всем третьим участкам устанавливается аренда - 20 фантов",
            "Все третьи участки освобождаются от налога",
            "Все участки отрасли \"Тяжёлая промышленность\" облагаются налогом - 50 фантов",
            "Всем участкам отрасли \"Тяжёлая промышленность\" устанавливается аренда - 10 фантов",
            "Всем участка отрасли \"Пищевая промышленность\" устанавливатся аренда - 50 фантов",
            "Все вторые участки освобождаются от налога",
            "Все участки отрасли \"Средства массовой информации\" освобождаются от налога",
            "Всем участкам центральной отрасли устанавливается аренда - 0 фантов",
            "Всем участкам отрасли \"Средства массовой информации\" устанавливается аренда - 0 фантов",
            "Все участки отрасли \"Связь и коммуникации\" освобождаются от налога",
            "Всем третьим участкам устанавливается аренда - 0 фантов",
            "Все участки центральной отрасли облагаются двойным налогом",
            "Всем вторым участкам устанавливается аренда - 20 фантов",
            "Всем участкам отрасли \"Средства массовой информации\" устанавливается аренда - 100 фантов",
            "Все участки отрасли \"Пищевая промышленность\" освобождаются от налога",
            "Все участки отрасли \"Добывающая промышленность\" облагаются двойным налогом",
            "Все участки отрасли \"Лёгкая промышленность\" освобождаются от налога",
            "Все участки Транспортной отрасли освобождаются от налога",
            "Все третьи участки облагаются двойным налогом",
            "Доход от акций, выплачиваемый на клетке \"Старт\" возрастает до 50 процентов за каждую акцию",
            "Налог с акций при прохождении клетки \"Налоговая инспекция\" устанавливается в размере 50 фантов за акцию",
    };
    private final int[] taxBase = {3, 3, 3, 5, 5, 8, 8, 8, 12, 12, 12, 15, 15, 15, 20, 20, 20, 25, 25, 25, 30, 30};
    private final int[] rentBase = {3, 5, 6, 8, 10, 14, 18, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 46, 50, 54, 60};
    private final int[] streetPrice = {50, 60, 70, 90, 100, 130, 140, 150, 170, 180, 190, 210, 220, 230, 250, 260, 270, 290, 300, 310, 340, 350, 500, 500, 500, 500};
    private final int[] streetBuildingPrice = {50, 50, 50, 50, 50, 100, 100, 100, 100, 100, 100, 150, 150, 150, 150, 150, 150, 200, 200, 200, 200, 200};

    public String[] players;
    public int[] owners = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    public int[] houses = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    public boolean[] pledge = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
    public String[] fortunes = new String[0];
    public int stockPrice = 100;
    public int[] playerStocks = new int[6];
    public boolean searchByAll = true;

    public int getStockPrice() {
        return stockPrice;
    }

    public void setStockPrice(int stockPrice) {
        this.stockPrice = stockPrice;
    }

    public int getPlayerStock(int index) {
        return playerStocks[index];
    }

    public void setPlayerStock(int index, int value) {
        playerStocks[index] = value;
    }

    public String[] getAvailableFortunes() {
        return availableFortunes;
    }

    public boolean isFortuneAdded(String fortune) {
        for (String s : fortunes) {
            if (fortune.equals(s))
                return true;
        }
        return false;
    }

    public void addFortune(String fortune) {
        String[] newFortunes = new String[fortunes.length+1];
        System.arraycopy(fortunes, 0, newFortunes, 0, fortunes.length);
        newFortunes[fortunes.length] = fortune;
        fortunes = newFortunes;
    }

    public void removeFortune(String fortune) {
        String[] newFortunes = new String[fortunes.length-1];
        int index = 0;
        for (String s: fortunes) {
            if (!s.equals(fortune)) {
                newFortunes[index] = s;
                index++;
            }
        }
        fortunes = newFortunes;
    }

    public String[] getFortunes() {
        return fortunes;
    }

    public int[] getStreetPrices() {
        return streetPrice;
    }

    public int[] getStreetBuildingPrices() {
        return streetBuildingPrice;
    }

    public int getStreetPrice(int index) {
        return streetPrice[index];
    }

    public int getStreetBuildingPrice (int index) {
        return streetBuildingPrice[index];
    }

    public String[] getStreetTitles() {
        return streetTitles;
    }

    public void setPlayers(String[] players) {
        ArrayList<String> realPlayers = new ArrayList<>();
        for (String player: players) {
            if (!player.equals(""))
                realPlayers.add(player);
        }
        this.players = realPlayers.toArray(new String[0]);
    }

    public String[] getPlayers() {
        return players;
    }

    public int getPlayerByName(String player) {
        int i = 1;
        for (String playerName: players) {
            if (playerName.equals(player))
                return i;
            i++;
        }
        return 0;
    }

    public int[] getTaxBase() {
        return taxBase;
    }

    public int[] getRentBase() {
        return rentBase;
    }

    public int[] getOwners() {
        return owners;
    }

    public int[] getHouses() {
        return houses;
    }

    public boolean[] getPledge() {
        return pledge;
    }

    public int getTaxBase(int index) {
        return taxBase[index];
    }

    public int getRentBase(int index) {
        return rentBase[index];
    }

    public int getOwner(int index) {
        return owners[index];
    }

    public int getHouse(int index) {
        return houses[index];
    }

    public boolean getPledged(int index) {
        return pledge[index];
    }

    public void setHouses(int[] houses) {
        this.houses = houses;
    }

    public void setOwners(int[] owners) {
        this.owners = owners;
    }

    public void setPledge(boolean[] pledge) {
        this.pledge = pledge;
    }

    public void setHouse(int house, int index) {
        this.houses[index] = house;
    }

    public void setOwner(int owner, int index) {
        this.owners[index] = owner;
    }

    public void setPledged(boolean pledged, int index) {
        this.pledge[index] = pledged;
    }
}
