/*
  Warnings:

  - You are about to drop the `Artist` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `userOnBookings` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('CUSTOMER', 'ARTIST');

-- DropForeignKey
ALTER TABLE "userOnBookings" DROP CONSTRAINT "userOnBookings_bookingId_fkey";

-- DropForeignKey
ALTER TABLE "userOnBookings" DROP CONSTRAINT "userOnBookings_userId_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "role" "Role" NOT NULL DEFAULT E'CUSTOMER';

-- DropTable
DROP TABLE "Artist";

-- DropTable
DROP TABLE "userOnBookings";

-- CreateTable
CREATE TABLE "ArtistProfile" (
    "id" SERIAL NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "about" VARCHAR(255),
    "artistId" INTEGER NOT NULL,

    CONSTRAINT "ArtistProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsersOnBookings" (
    "userId" INTEGER NOT NULL,
    "bookingId" INTEGER NOT NULL,

    CONSTRAINT "UsersOnBookings_pkey" PRIMARY KEY ("userId","bookingId")
);

-- CreateIndex
CREATE UNIQUE INDEX "ArtistProfile_artistId_key" ON "ArtistProfile"("artistId");

-- AddForeignKey
ALTER TABLE "ArtistProfile" ADD CONSTRAINT "ArtistProfile_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsersOnBookings" ADD CONSTRAINT "UsersOnBookings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsersOnBookings" ADD CONSTRAINT "UsersOnBookings_bookingId_fkey" FOREIGN KEY ("bookingId") REFERENCES "Booking"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
