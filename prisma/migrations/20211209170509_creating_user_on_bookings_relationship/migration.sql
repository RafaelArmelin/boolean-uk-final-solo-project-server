-- CreateTable
CREATE TABLE "userOnBookings" (
    "userId" INTEGER NOT NULL,
    "bookingId" INTEGER NOT NULL,

    CONSTRAINT "userOnBookings_pkey" PRIMARY KEY ("userId","bookingId")
);

-- AddForeignKey
ALTER TABLE "userOnBookings" ADD CONSTRAINT "userOnBookings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userOnBookings" ADD CONSTRAINT "userOnBookings_bookingId_fkey" FOREIGN KEY ("bookingId") REFERENCES "Booking"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
