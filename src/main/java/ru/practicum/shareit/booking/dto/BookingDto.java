package ru.practicum.shareit.booking.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import ru.practicum.shareit.booking.model.BookingStatus;
import ru.practicum.shareit.item.model.Item;
import ru.practicum.shareit.user.model.User;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
public class BookingDto {
    private Long id;
    private Item item;
    private LocalDateTime start;
    private LocalDateTime end;
    private BookingStatus status;
    private User booker;
}
