/*
  Warnings:

  - You are about to drop the `UsersOnBookings` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "UsersOnBookings" DROP CONSTRAINT "UsersOnBookings_bookingId_fkey";

-- DropForeignKey
ALTER TABLE "UsersOnBookings" DROP CONSTRAINT "UsersOnBookings_userId_fkey";

-- DropTable
DROP TABLE "UsersOnBookings";

-- CreateTable
CREATE TABLE "_BookingToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_BookingToUser_AB_unique" ON "_BookingToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_BookingToUser_B_index" ON "_BookingToUser"("B");

-- AddForeignKey
ALTER TABLE "_BookingToUser" ADD FOREIGN KEY ("A") REFERENCES "Booking"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookingToUser" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
