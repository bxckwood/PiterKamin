-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Basket" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Basket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Favourites" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Favourites_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Compares" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Compares_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "price" INTEGER NOT NULL,
    "discount" INTEGER NOT NULL DEFAULT 0,
    "size" INTEGER NOT NULL,
    "power" INTEGER NOT NULL,
    "place" TEXT NOT NULL,
    "material" TEXT NOT NULL,
    "diametr" INTEGER NOT NULL,
    "width" INTEGER NOT NULL,
    "height" INTEGER NOT NULL,
    "combustion" BOOLEAN NOT NULL,
    "oven" BOOLEAN NOT NULL,
    "fuel" TEXT NOT NULL,
    "cleanGlass" BOOLEAN NOT NULL,
    "country" TEXT NOT NULL,
    "goal" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "img" TEXT[],
    "video" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "text" TEXT NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Montage" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "price" INTEGER NOT NULL,

    CONSTRAINT "Montage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_BasketToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_FavouritesToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ComparesToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Basket_userId_key" ON "Basket"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Favourites_userId_key" ON "Favourites"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Compares_userId_key" ON "Compares"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "_BasketToProduct_AB_unique" ON "_BasketToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_BasketToProduct_B_index" ON "_BasketToProduct"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FavouritesToProduct_AB_unique" ON "_FavouritesToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_FavouritesToProduct_B_index" ON "_FavouritesToProduct"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ComparesToProduct_AB_unique" ON "_ComparesToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_ComparesToProduct_B_index" ON "_ComparesToProduct"("B");

-- AddForeignKey
ALTER TABLE "Basket" ADD CONSTRAINT "Basket_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favourites" ADD CONSTRAINT "Favourites_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compares" ADD CONSTRAINT "Compares_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BasketToProduct" ADD CONSTRAINT "_BasketToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "Basket"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BasketToProduct" ADD CONSTRAINT "_BasketToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FavouritesToProduct" ADD CONSTRAINT "_FavouritesToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "Favourites"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FavouritesToProduct" ADD CONSTRAINT "_FavouritesToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ComparesToProduct" ADD CONSTRAINT "_ComparesToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "Compares"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ComparesToProduct" ADD CONSTRAINT "_ComparesToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
