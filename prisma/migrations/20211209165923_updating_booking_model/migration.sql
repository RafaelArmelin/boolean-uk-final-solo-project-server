/*
  Warnings:

  - You are about to drop the column `customerId` on the `Booking` table. All the data in the column will be lost.
  - Added the required column `dateAndTime` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pinterestBoard` to the `Booking` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Booking" DROP COLUMN "customerId",
ADD COLUMN     "dateAndTime" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "description" VARCHAR(255) NOT NULL,
ADD COLUMN     "pinterestBoard" TEXT NOT NULL;
